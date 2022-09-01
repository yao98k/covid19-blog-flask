from flask import Flask,render_template,flash,redirect,url_for,session,logging,request
from flask_mysqldb import MySQL
from wtforms import Form,StringField,TextAreaField,PasswordField,validators
from passlib.hash import sha256_crypt
from functools import wraps
import requests

app = Flask(__name__)
app.secret_key= "covid19"

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = ""
app.config["MYSQL_DB"] = "covid19"
app.config["MYSQL_CURSORCLASS"] = "DictCursor"

mysql = MySQL(app)
url = "https://api.covid19api.com/live/country/turkey/status/confirmed"
@app.route("/",methods = ["GET","POST"])
def index():
    response = requests.get(url)
    infos =  response.json()
    coronaInfo = dict()
    x = len(infos)
    #print(infos)
    #print("*****************")
    print(x)
    coronaInfo["Confirmed"] = infos[x-1]["Confirmed"] 
    coronaInfo["Deaths"] = infos[x-1]["Deaths"] 
    coronaInfo["Recovered"] = infos[x-1]["Recovered"] 
    coronaInfo["Active"] = infos[x-1]["Active"] 

    return render_template("index.html",infos= coronaInfo)



# Kullanıcı Giriş Decorator'ı
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "girildi" in session:
            return f(*args, **kwargs)
        else:
            flash("Bu sayfayı görüntülemek için lütfen giriş yapın.","danger")
            return redirect(url_for("giris"))

    return decorated_function

# Kayıt Formu
class RegisterForm(Form):
    name = StringField("İsim Soyisim",validators=[validators.Length(min = 4,max = 25)])
    username = StringField("Kullanıcı Adı",validators=[validators.Length(min = 5,max = 35)])
    email = StringField("Email Adresi",validators=[validators.Email(message = "Lütfen Geçerli Bir Email Adresi Girin...")])
    password = PasswordField("Parola:",validators=[
        validators.DataRequired(message = "Lütfen bir parola belirleyin"),
        validators.EqualTo(fieldname = "confirm",message="Parolanız Uyuşmuyor...")
    ])
    confirm = PasswordField("Parola Doğrula")

# Giriş Formu
class LoginForm(Form):
    username = StringField("Kullanıcı Adı")
    password = PasswordField("Parola")

# Makale Form
class ArticleForm(Form):
    title = StringField("Makale Başlığı",validators=[validators.Length(min = 5,max = 100)]) 
    content = TextAreaField("Makale İçeriği",validators=[validators.Length(min = 10)])
#Kavram Formu
class KavramForm(Form):
    title = StringField("Kavram",validators=[validators.Length(min = 5,max = 100)]) 
    content = TextAreaField("İçerik",validators=[validators.Length(min = 10)])

#Kayıt Olma
@app.route("/kayitol",methods = ["GET","POST"])
def kayitol():
    form = RegisterForm(request.form)

    if request.method == "POST" and form.validate():
        name = form.name.data
        username = form.username.data
        email = form.email.data
        password = sha256_crypt.encrypt(form.password.data)

        cursor = mysql.connection.cursor()

        sorgu = "Insert into users(name,email,username,password) VALUES(%s,%s,%s,%s)"

        cursor.execute(sorgu,(name,email,username,password))
        mysql.connection.commit()

        cursor.close()
        flash("Başarıyla Kayıt Oldunuz...","success")
        return redirect(url_for("giris"))
    else:
        return render_template("kayitol.html",form = form)
# Login İşlemi
@app.route("/giris",methods =["GET","POST"])
def giris():
    form = LoginForm(request.form)
    if request.method == "POST":
       username = form.username.data
       password_entered = form.password.data

       cursor = mysql.connection.cursor()

       sorgu = "Select * From users where username = %s"

       result = cursor.execute(sorgu,(username,))

       if result > 0:
           data = cursor.fetchone()
           real_password = data["password"]
           if sha256_crypt.verify(password_entered,real_password):
               flash("Başarıyla Giriş Yaptınız...","success")

               session["girildi"] = True
               session["username"] = username

               return redirect(url_for("index"))
           else:
               flash("Parolanızı Yanlış Girdiniz...","danger")
               return redirect(url_for("giris")) 

       else:
           flash("Böyle bir kullanıcı bulunmuyor...","danger")
           return redirect(url_for("giris"))

    
    return render_template("giris.html",form = form)

# Logout İşlemi
@app.route("/cikis")
def cikis():
    session.clear()
    return redirect(url_for("index"))


@app.route("/panel")
@login_required
def panel():
    cursor = mysql.connection.cursor()
    cursor2 = mysql.connection.cursor()
    sorgu = "Select * From articles where author = %s"
    sorgu2= "Select * From kavramlar"
    result = cursor.execute(sorgu,(session["username"],))
    result2 = cursor2.execute(sorgu2)
    if result or result2 > 0:
        articles = cursor.fetchall()
        kavramlar = cursor2.fetchall()
        return render_template("panel.html",articles = articles, kavramlar = kavramlar)
    
    else:
        return render_template("panel.html")
    cursor.close()
    cursor2.close()

#Makale ve Haber İşlemleri
# Makale Sayfası
@app.route("/makaleler")
def makaleler():
    cursor = mysql.connection.cursor()

    sorgu = "Select * From articles"

    result = cursor.execute(sorgu)

    if result > 0:
        articles = cursor.fetchall()
        return render_template("makaleler.html",articles = articles)
    else:
        return render_template("makaleler.html")
# Makale Ekleme
@app.route("/mekle",methods = ["GET","POST"])
def mekle():
    form = ArticleForm(request.form)
    if request.method == "POST" and form.validate():
        title = form.title.data
        content = form.content.data

        cursor = mysql.connection.cursor()

        sorgu = "Insert into articles(title,author,content) VALUES(%s,%s,%s)"

        cursor.execute(sorgu,(title,session["username"],content))

        mysql.connection.commit()

        cursor.close()

        flash("Makale Başarıyla Eklendi","success")

        return redirect(url_for("panel"))

    return render_template("mekle.html",form = form)
#Makale Silme
@app.route("/sil/<string:id>")
@login_required
def sil(id):
    cursor = mysql.connection.cursor()

    sorgu = "Select * from articles where author = %s and id = %s"

    result = cursor.execute(sorgu,(session["username"],id))

    if result > 0:
        sorgu2 = "Delete from articles where id = %s"

        cursor.execute(sorgu2,(id,))

        mysql.connection.commit()

        return redirect(url_for("panel"))
    else:
        flash("Böyle bir makale yok veya bu işleme yetkiniz yok","danger")
        return redirect(url_for("index"))
    cursor.close()

# Makale Güncelleme
@app.route("/guncelle/<string:id>",methods = ["GET","POST"])
@login_required
def update(id):
   if request.method == "GET":
       cursor = mysql.connection.cursor()

       sorgu = "Select * from articles where id = %s and author = %s"
       result = cursor.execute(sorgu,(id,session["username"]))

       if result == 0:
           flash("Böyle bir makale yok veya bu işleme yetkiniz yok","danger")
           return redirect(url_for("index"))
       else:
           article = cursor.fetchone()
           form = ArticleForm()

           form.title.data = article["title"]
           form.content.data = article["content"]
           return render_template("guncelleme.html",form = form)

   else:
       # POST REQUEST
       form = ArticleForm(request.form)

       newTitle = form.title.data
       newContent = form.content.data

       sorgu2 = "Update articles Set title = %s,content = %s where id = %s "

       cursor = mysql.connection.cursor()

       cursor.execute(sorgu2,(newTitle,newContent,id))

       mysql.connection.commit()

       flash("Makale başarıyla güncellendi","success")

       return redirect(url_for("panel"))

       pass


# Detay Sayfası
@app.route("/makale/<string:id>")
def makale(id):
    cursor = mysql.connection.cursor()
    
    sorgu = "Select * from articles where id = %s"

    result = cursor.execute(sorgu,(id,))

    if result > 0:
        article = cursor.fetchone()
        return render_template("makale.html",article = article)
    else:
        return render_template("makale.html")

#Kavram İşlemleri
@app.route("/kavramlar")
def kavramlar():
    cursor = mysql.connection.cursor()
    sorgu = "Select * From kavramlar ORDER BY title ASC"
    result = cursor.execute(sorgu)

    if result > 0:
        kavram = cursor.fetchall()
        return render_template("kavramlar.html",kavramlar = kavram)
    else:
        return render_template("kavramlar.html")
#Kavram Ekleme
@app.route("/kekle",methods = ["GET","POST"])
def kekle():
    form = KavramForm(request.form)
    if request.method == "POST" and form.validate():
        title = form.title.data
        content = form.content.data

        cursor = mysql.connection.cursor()

        sorgu = "Insert into kavramlar(title,content) VALUES(%s,%s)"

        cursor.execute(sorgu,(title,content))

        mysql.connection.commit()

        cursor.close()

        flash("Kavram Başarıyla Eklendi","success")

        return redirect(url_for("panel"))

    return render_template("kekle.html",form = form)
#Kavram Sil
@app.route("/ksil/<string:id>")
@login_required
def ksil(id):
    cursor = mysql.connection.cursor()

    sorgu = "Select * from kavramlar where id = %s"

    result = cursor.execute(sorgu,(id,))

    if result > 0:
        sorgu2 = "Delete From kavramlar where id = %s"

        cursor.execute(sorgu2,(id,))

        mysql.connection.commit()

        return redirect(url_for("panel"))
    else:
        flash("Böyle bir kavram yok","danger")
        return redirect(url_for("index"))
    cursor.close()

# Kavram Güncelle
@app.route("/kguncelle/<string:id>",methods = ["GET","POST"])
@login_required
def kavramupdate(id):
   if request.method == "GET":
       cursor = mysql.connection.cursor()

       sorgu = "Select * from kavramlar where id = %s"
       result = cursor.execute(sorgu,(id))

       if result == 0:
           flash("Hata","danger")
           return redirect(url_for("index"))
       else:
           kavram = cursor.fetchone()
           form = KavramForm()

           form.title.data = kavram["title"]
           form.content.data = kavram["content"]
           return render_template("guncelleme.html",form = form)

   else:
       # POST REQUEST
       form = KavramForm(request.form)

       newTitle = form.title.data
       newContent = form.content.data

       sorgu2 = "Update kavramlar Set title = %s,content = %s where id = %s "

       cursor = mysql.connection.cursor()

       cursor.execute(sorgu2,(newTitle,newContent,id))

       mysql.connection.commit()

       flash("Kavram başarıyla güncellendi","success")

       return redirect(url_for("panel"))

       pass
if __name__ == "__main__":
    app.run(debug=True)