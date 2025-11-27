.class public Lcom/flyersoft/tools/BookDb$BookDBHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "BookDb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/BookDb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BookDBHelper"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x7

    .line 1338
    invoke-direct {p0, p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 1343
    const-string v0, "create table books (_id integer primary key autoincrement, book text, filename text, lowerFilename text, author text, description text, category text, thumbFile text, coverFile text, addTime text, favorite text, downloadUrl text, rate text, bak1 text, bak2 text);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1344
    const-string v0, "create table notes (_id integer primary key autoincrement, book text, filename text, lowerFilename text, lastChapter NUMERIC, lastSplitIndex NUMERIC, lastPosition NUMERIC, highlightLength NUMERIC, highlightColor NUMERIC, time NUMERIC, bookmark text, note text, original text, underline NUMERIC, strikethrough NUMERIC, bak text);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1345
    const-string v0, "create table statistics (_id integer primary key autoincrement, filename text, usedTime NUMERIC, readWords NUMERIC, dates text);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1346
    const-string v0, "create table tmpbooks (_id integer primary key autoincrement, book text, filename text, lowerFilename text, author text, description text, category text, thumbFile text, coverFile text, addTime text, favorite text, downloadUrl text, rate text, bak1 text, bak2 text);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 1347
    const-string v0, "create table covers2 (_id integer primary key autoincrement, filename text, cover text);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    const/4 p3, 0x2

    if-ge p2, p3, :cond_0

    .line 1354
    const-string p3, "create table notes (_id integer primary key autoincrement, book text, filename text, lowerFilename text, lastChapter NUMERIC, lastSplitIndex NUMERIC, lastPosition NUMERIC, highlightLength NUMERIC, highlightColor NUMERIC, time NUMERIC, bookmark text, note text, original text, underline NUMERIC, strikethrough NUMERIC, bak text);"

    invoke-virtual {p1, p3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    const/4 p3, 0x4

    if-ge p2, p3, :cond_1

    .line 1356
    const-string p3, "create table statistics (_id integer primary key autoincrement, filename text, usedTime NUMERIC, readWords NUMERIC, dates text);"

    invoke-virtual {p1, p3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1
    const/4 p3, 0x6

    if-ge p2, p3, :cond_2

    .line 1358
    const-string p3, "create table covers2 (_id integer primary key autoincrement, filename text, cover text);"

    invoke-virtual {p1, p3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_2
    const/4 p3, 0x7

    if-ge p2, p3, :cond_3

    .line 1360
    const-string p2, "create table tmpbooks (_id integer primary key autoincrement, book text, filename text, lowerFilename text, author text, description text, category text, thumbFile text, coverFile text, addTime text, favorite text, downloadUrl text, rate text, bak1 text, bak2 text);"

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_3
    return-void
.end method
