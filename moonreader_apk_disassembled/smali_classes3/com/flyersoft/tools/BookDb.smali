.class public Lcom/flyersoft/tools/BookDb;
.super Ljava/lang/Object;
.source "BookDb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/tools/BookDb$BookDBHelper;,
        Lcom/flyersoft/tools/BookDb$ReadStatistics;,
        Lcom/flyersoft/tools/BookDb$BookInfo;,
        Lcom/flyersoft/tools/BookDb$BookCollection;,
        Lcom/flyersoft/tools/BookDb$NoteInfo;,
        Lcom/flyersoft/tools/BookDb$PDF_META;,
        Lcom/flyersoft/tools/BookDb$DayStatistics;
    }
.end annotation


# static fields
.field private static final DATABASE_CREATE_BOOKS:Ljava/lang/String; = "create table books (_id integer primary key autoincrement, book text, filename text, lowerFilename text, author text, description text, category text, thumbFile text, coverFile text, addTime text, favorite text, downloadUrl text, rate text, bak1 text, bak2 text);"

.field private static final DATABASE_CREATE_NOTES:Ljava/lang/String; = "create table notes (_id integer primary key autoincrement, book text, filename text, lowerFilename text, lastChapter NUMERIC, lastSplitIndex NUMERIC, lastPosition NUMERIC, highlightLength NUMERIC, highlightColor NUMERIC, time NUMERIC, bookmark text, note text, original text, underline NUMERIC, strikethrough NUMERIC, bak text);"

.field private static final DATABASE_CREATE_RANDOMCOVERS:Ljava/lang/String; = "create table covers2 (_id integer primary key autoincrement, filename text, cover text);"

.field private static final DATABASE_CREATE_STATISTICS:Ljava/lang/String; = "create table statistics (_id integer primary key autoincrement, filename text, usedTime NUMERIC, readWords NUMERIC, dates text);"

.field private static final DATABASE_TEMP_BOOKS:Ljava/lang/String; = "create table tmpbooks (_id integer primary key autoincrement, book text, filename text, lowerFilename text, author text, description text, category text, thumbFile text, coverFile text, addTime text, favorite text, downloadUrl text, rate text, bak1 text, bak2 text);"

.field public static final DBNAME:Ljava/lang/String; = "mrbooks.db"

.field public static final DEFAULT_FAV:Ljava/lang/String; = "default_fav"

.field public static final MANUAL_SORT_TAG:Ljava/lang/String; = "#@#"

.field public static MAX_DESCRIPTION_SIZE:I = 0x7d0

.field public static final SHELF_TYPE_ALL:I = 0x0

.field public static final SHELF_TYPE_AUTHORS:I = 0x3

.field public static final SHELF_TYPE_CATEGORIES:I = 0x4

.field public static final SHELF_TYPE_FAVORITES:I = 0x1

.field public static final SHELF_TYPE_FOLDERS:I = 0x5

.field public static final SHELF_TYPE_RATINGS:I = 0x6

.field public static final SHELF_TYPE_SERIES:I = 0x2

.field static allBooks:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation
.end field

.field static allBooksTime:J = 0x0L

.field public static hasNewDownload:Z = false

.field private static inTransition:Z = false

.field private static mDb:Landroid/database/sqlite/SQLiteDatabase;

.field private static mDbHelper:Lcom/flyersoft/tools/BookDb$BookDBHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addBookToCollection(Ljava/util/ArrayList;Landroid/database/Cursor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .line 629
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->createBookItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object p1

    .line 630
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 632
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static addBookmark(Lcom/flyersoft/tools/A$Bookmark;)V
    .locals 1

    .line 1617
    invoke-static {p0}, Lcom/flyersoft/tools/BookDb;->bookmarkToNote(Lcom/flyersoft/tools/A$Bookmark;)Lcom/flyersoft/tools/BookDb$NoteInfo;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/flyersoft/tools/BookDb;->insertNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Z)J

    return-void
.end method

.method private static alGet(Ljava/util/ArrayList;I)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1737
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string p1, "<BR>"

    const-string v0, "\n"

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static beginTransition()V
    .locals 1

    .line 88
    sget-boolean v0, Lcom/flyersoft/tools/BookDb;->inTransition:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 92
    :try_start_0
    sput-boolean v0, Lcom/flyersoft/tools/BookDb;->inTransition:Z

    .line 93
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 95
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public static bookExists(Ljava/lang/String;)Z
    .locals 8

    .line 337
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "books"

    const/4 v2, 0x0

    const-string v3, "lowerFilename=?"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 338
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 339
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return v0
.end method

.method public static bookmarkToNote(Lcom/flyersoft/tools/A$Bookmark;)Lcom/flyersoft/tools/BookDb$NoteInfo;
    .locals 18

    move-object/from16 v0, p0

    .line 1621
    new-instance v1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v2, v0, Lcom/flyersoft/tools/A$Bookmark;->filename:Ljava/lang/String;

    .line 1623
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/flyersoft/tools/A$Bookmark;->filename:Ljava/lang/String;

    iget v4, v0, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    iget v5, v0, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    iget-wide v6, v0, Lcom/flyersoft/tools/A$Bookmark;->position:J

    iget v8, v0, Lcom/flyersoft/tools/A$Bookmark;->color:I

    sget v9, Lcom/flyersoft/tools/A;->highlight_color:I

    iget-wide v10, v0, Lcom/flyersoft/tools/A$Bookmark;->time:J

    iget-object v12, v0, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, ""

    move-object v0, v1

    const/4 v1, 0x0

    const-string v13, ""

    const-string v14, ""

    const/4 v15, 0x0

    invoke-direct/range {v0 .. v17}, Lcom/flyersoft/tools/BookDb$NoteInfo;-><init>(ILjava/lang/String;Ljava/lang/String;IIJIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    return-object v0
.end method

.method public static changeBookFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    const-string v0, "update3: "

    const-string v1, "update1: "

    .line 496
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_0

    .line 498
    :cond_0
    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->bookExists(Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "books"

    const-string v4, "lowerFilename=?"

    if-eqz v2, :cond_1

    .line 499
    :try_start_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 500
    :cond_1
    invoke-static {p0}, Lcom/flyersoft/tools/BookDb;->bookExists(Ljava/lang/String;)Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v5, 0x0

    const/4 v6, 0x1

    const-string v7, "lowerFilename"

    const-string v8, "filename"

    if-eqz v2, :cond_2

    .line 501
    :try_start_2
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 502
    invoke-virtual {v2, v8, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v7, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 505
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/String;

    move-result-object v10

    .line 504
    invoke-virtual {v1, v3, v2, v4, v10}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v6, [Ljava/lang/Object;

    aput-object v1, v2, v5

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 507
    :cond_2
    invoke-static {p0}, Lcom/flyersoft/tools/BookDb;->noteExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 508
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 509
    invoke-virtual {v1, v8, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v7, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "notes"

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v3, v1, v4, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 515
    :cond_3
    invoke-static {p0}, Lcom/flyersoft/tools/BookDb;->statisticsExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 516
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 517
    invoke-virtual {v1, v8, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v2, "statistics"

    const-string v3, "filename=?"

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v2, v1, v3, p0}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-array p1, v6, [Ljava/lang/Object;

    aput-object p0, p1, v5

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 521
    :cond_4
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->clearAllBooks()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 523
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public static changeBookFileInGroup(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 997
    sget-object v0, Lcom/flyersoft/tools/A;->listShelfBookCaches:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 999
    invoke-virtual {v1}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1000
    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_0
    if-ltz v2, :cond_0

    .line 1001
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1002
    iget-object v0, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v0, v2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1003
    invoke-static {}, Lcom/flyersoft/tools/A;->getShelfTopBooks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    if-ltz p0, :cond_1

    .line 1005
    invoke-static {}, Lcom/flyersoft/tools/A;->getShelfTopBooks()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1006
    invoke-static {}, Lcom/flyersoft/tools/A;->saveShelfTopBooks()V

    :cond_1
    const/4 p0, 0x0

    .line 1012
    invoke-static {v1, p0}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    return-void

    :cond_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private static changeGroupSubBooks(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 483
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 484
    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 485
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 487
    iget-object v2, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v2, v1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x0

    .line 488
    invoke-static {v0, v1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static checkBooksAvailable(Ljava/util/ArrayList;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;Z)V"
        }
    .end annotation

    .line 827
    sget-object v0, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFolder(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 829
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_4

    .line 830
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 831
    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    const/4 v3, 0x0

    .line 832
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 833
    :cond_1
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    if-eqz p1, :cond_2

    .line 834
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    invoke-static {v1, v2}, Lcom/flyersoft/tools/BookDb;->deleteBook(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)I

    .line 835
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_4
    :goto_2
    return-void
.end method

.method public static clearAllBooks()V
    .locals 1

    const/4 v0, 0x0

    .line 542
    sput-object v0, Lcom/flyersoft/tools/BookDb;->allBooks:Ljava/util/ArrayList;

    return-void
.end method

.method public static clearBookmarks(Ljava/lang/String;)V
    .locals 3

    .line 1591
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "notes"

    const-string v2, "lowerFilename=? and bookmark<>\'\'"

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, v2, p0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 1598
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static confirmNoteNotExistAgain(Lcom/flyersoft/tools/BookDb$NoteInfo;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/A$Bookmark;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            ">;)Z"
        }
    .end annotation

    .line 1840
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_1

    .line 1841
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/A$Bookmark;

    .line 1842
    iget v0, p2, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    iget v2, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-ne v0, v2, :cond_0

    iget v0, p2, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    iget v2, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    if-ne v0, v2, :cond_0

    iget-wide v2, p2, Lcom/flyersoft/tools/A$Bookmark;->position:J

    iget-wide v4, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    iget-object v0, p2, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    .line 1843
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget p2, p2, Lcom/flyersoft/tools/A$Bookmark;->color:I

    iget v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    if-ne p2, v0, :cond_0

    return v1

    .line 1846
    :cond_1
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1847
    iget v0, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v2, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-ne v0, v2, :cond_2

    iget v0, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    iget v2, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    if-ne v0, v2, :cond_2

    iget-wide v2, p2, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide v4, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_2

    .line 1848
    invoke-static {p2, p0}, Lcom/flyersoft/tools/BookDb;->differentNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    move-result p2

    if-nez p2, :cond_2

    return v1

    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method public static createBookInfoFromFile(Ljava/lang/String;Ljava/lang/String;Z)Lcom/flyersoft/tools/BookDb$BookInfo;
    .locals 18

    .line 1370
    invoke-static/range {p1 .. p1}, Lcom/flyersoft/tools/compress/BaseCompressor;->getZRCacheFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1371
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1372
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 1375
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1376
    invoke-static {v2}, Lcom/flyersoft/tools/A;->isDownloadFile(Ljava/lang/String;)Z

    move-result v4

    .line 1377
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFileExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1379
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getBookType(Ljava/lang/String;)I

    move-result v0

    const/16 v6, 0x64

    const-string v7, "UNKNOW"

    const/4 v15, 0x1

    if-ne v0, v6, :cond_f

    .line 1381
    const-string v0, ".epub"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, ".epub3"

    invoke-virtual {v5, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static {v5}, Lcom/flyersoft/tools/A;->isMobiExt(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_3

    .line 1385
    :cond_1
    const-string v0, ".fb2"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, ".fb2.zip"

    invoke-virtual {v2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_2

    .line 1387
    :cond_2
    const-string v0, ".umd"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1388
    new-instance v0, Lcom/flyersoft/books/Umd;

    invoke-direct {v0, v2, v15}, Lcom/flyersoft/books/Umd;-><init>(Ljava/lang/String;Z)V

    goto/16 :goto_4

    .line 1389
    :cond_3
    const-string v0, ".chm"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1390
    new-instance v0, Lcom/flyersoft/books/Chm;

    invoke-direct {v0, v2, v15}, Lcom/flyersoft/books/Chm;-><init>(Ljava/lang/String;Z)V

    goto :goto_4

    .line 1391
    :cond_4
    const-string v0, ".docx"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, ".odt"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_1

    .line 1393
    :cond_5
    const-string v0, ".rtf"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1394
    new-instance v0, Lcom/flyersoft/books/Rtf;

    invoke-direct {v0, v2, v15}, Lcom/flyersoft/books/Rtf;-><init>(Ljava/lang/String;Z)V

    goto :goto_4

    .line 1395
    :cond_6
    const-string v0, ".md"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1396
    new-instance v0, Lcom/flyersoft/books/Md;

    invoke-direct {v0, v2, v15}, Lcom/flyersoft/books/Md;-><init>(Ljava/lang/String;Z)V

    goto :goto_4

    .line 1397
    :cond_7
    const-string v0, ".mht"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    const-string v0, ".mhtml"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_0

    :cond_8
    move-object v0, v1

    goto :goto_4

    .line 1398
    :cond_9
    :goto_0
    new-instance v0, Lcom/flyersoft/books/Mhtml;

    invoke-direct {v0, v2, v15}, Lcom/flyersoft/books/Mhtml;-><init>(Ljava/lang/String;Z)V

    goto :goto_4

    .line 1392
    :cond_a
    :goto_1
    new-instance v0, Lcom/flyersoft/books/Docx;

    invoke-direct {v0, v2, v15}, Lcom/flyersoft/books/Docx;-><init>(Ljava/lang/String;Z)V

    goto :goto_4

    .line 1386
    :cond_b
    :goto_2
    new-instance v0, Lcom/flyersoft/books/Fb2;

    invoke-direct {v0, v2, v15}, Lcom/flyersoft/books/Fb2;-><init>(Ljava/lang/String;Z)V

    goto :goto_4

    .line 1382
    :cond_c
    :goto_3
    new-instance v0, Lcom/flyersoft/books/Epub;

    invoke-direct {v0, v2, v15}, Lcom/flyersoft/books/Epub;-><init>(Ljava/lang/String;Z)V

    :goto_4
    if-eqz v0, :cond_10

    .line 1400
    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->isInited()Z

    move-result v5

    if-eqz v5, :cond_10

    .line 1401
    new-instance v1, Lcom/flyersoft/tools/BookDb$BookInfo;

    move-object v5, v1

    .line 1402
    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getBookName()Ljava/lang/String;

    move-result-object v1

    move-object v6, v3

    .line 1404
    invoke-virtual {v0}, Lcom/flyersoft/books/BaseEBook;->getAuthor()Ljava/lang/String;

    move-result-object v3

    iget-object v9, v0, Lcom/flyersoft/books/BaseEBook;->description:Ljava/lang/String;

    .line 1405
    invoke-static {v9}, Lcom/flyersoft/tools/A;->trimHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/flyersoft/tools/A;->doTrimBlankSpace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iget-object v0, v0, Lcom/flyersoft/books/BaseEBook;->categories:Ljava/util/ArrayList;

    .line 1406
    invoke-static {v0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    move-object v10, v6

    .line 1407
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getBookThumbFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object v11, v7

    .line 1408
    invoke-static {v2}, Lcom/flyersoft/tools/A;->getBookCoverFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v4, :cond_d

    move-object v10, v11

    .line 1411
    :cond_d
    const-string v13, ""

    const-string v14, ""

    const-string v11, ""

    const-string v12, ""

    move-object v4, v5

    move-object v5, v0

    move-object v0, v4

    move-object v4, v9

    move-object/from16 v9, p0

    invoke-direct/range {v0 .. v14}, Lcom/flyersoft/tools/BookDb$BookInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_e

    .line 1418
    invoke-static {v0, v15}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    :cond_e
    return-object v0

    :cond_f
    move-object v10, v3

    move-object v11, v7

    .line 1421
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_11

    :cond_10
    return-object v1

    .line 1423
    :cond_11
    invoke-static {v2}, Lcom/flyersoft/tools/T;->getOnlyFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1425
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "("

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v6, v15, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ")\n"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1429
    const-string v0, ".pdf"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v7, "_2.png"

    const-string v9, "/"

    const/4 v12, 0x0

    if-eqz v0, :cond_1a

    .line 1432
    :try_start_0
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0}, Lcom/radaee/pdf/Global;->Init(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 1433
    new-instance v0, Lcom/radaee/pdf/Document;

    invoke-direct {v0}, Lcom/radaee/pdf/Document;-><init>()V

    .line 1434
    invoke-virtual {v0, v2, v10}, Lcom/radaee/pdf/Document;->Open(Ljava/lang/String;Ljava/lang/String;)I

    move-result v13

    if-nez v13, :cond_18

    .line 1435
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v14, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 1436
    :try_start_1
    invoke-static {v13}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_12

    .line 1437
    invoke-static {v0, v12, v1}, Lcom/flyersoft/books/PDFReader;->createBitmapOfPdfPage(Lcom/radaee/pdf/Document;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object v14

    .line 1438
    invoke-static {v14, v2, v12}, Lcom/flyersoft/tools/A;->generateBookCovers(Landroid/graphics/Bitmap;Ljava/lang/String;Z)V

    .line 1440
    :cond_12
    invoke-static {v0}, Lcom/flyersoft/tools/BookDb;->getPDF_META(Lcom/radaee/pdf/Document;)Lcom/flyersoft/tools/BookDb$PDF_META;

    move-result-object v0

    .line 1441
    iget-object v14, v0, Lcom/flyersoft/tools/BookDb$PDF_META;->title:Ljava/lang/String;

    invoke-static {v14}, Lcom/flyersoft/books/PDFReader;->validatedPdfMetaTitle(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_17

    .line 1442
    iget-object v14, v0, Lcom/flyersoft/tools/BookDb$PDF_META;->title:Ljava/lang/String;

    if-eqz v14, :cond_13

    .line 1443
    iget-object v3, v0, Lcom/flyersoft/tools/BookDb$PDF_META;->title:Ljava/lang/String;

    .line 1444
    :cond_13
    iget-object v14, v0, Lcom/flyersoft/tools/BookDb$PDF_META;->author:Ljava/lang/String;

    if-eqz v14, :cond_14

    .line 1445
    iget-object v14, v0, Lcom/flyersoft/tools/BookDb$PDF_META;->author:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    goto :goto_5

    :cond_14
    move-object v14, v10

    .line 1446
    :goto_5
    :try_start_2
    iget-object v15, v0, Lcom/flyersoft/tools/BookDb$PDF_META;->category:Ljava/lang/String;

    if-eqz v15, :cond_15

    .line 1447
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object/from16 v16, v1

    :try_start_3
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$PDF_META;->category:Ljava/lang/String;

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v6, v1

    goto :goto_6

    :cond_15
    move-object/from16 v16, v1

    .line 1448
    :goto_6
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$PDF_META;->subject:Ljava/lang/String;

    if-eqz v1, :cond_16

    .line 1449
    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$PDF_META;->subject:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_7

    :cond_16
    move-object v0, v10

    goto :goto_7

    :catchall_0
    move-exception v0

    goto :goto_8

    :catchall_1
    move-exception v0

    move-object/from16 v16, v1

    goto :goto_8

    :cond_17
    move-object/from16 v16, v1

    move-object v0, v10

    move-object v14, v0

    goto :goto_7

    :catchall_2
    move-exception v0

    move-object/from16 v16, v1

    move-object v14, v10

    goto :goto_8

    :cond_18
    move-object/from16 v16, v1

    return-object v16

    :cond_19
    move-object/from16 v16, v1

    move-object v0, v10

    move-object v13, v0

    move-object v14, v13

    :goto_7
    move-object v1, v0

    goto :goto_9

    :catchall_3
    move-exception v0

    move-object/from16 v16, v1

    move-object v13, v10

    move-object v14, v13

    .line 1455
    :goto_8
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    move-object v1, v10

    goto :goto_9

    :cond_1a
    move-object/from16 v16, v1

    move-object v1, v10

    move-object v13, v1

    move-object v14, v13

    .line 1458
    :goto_9
    const-string v0, ".djvu"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 1461
    :try_start_4
    new-instance v0, Lorg/djvu/DDocument;

    invoke-direct {v0}, Lorg/djvu/DDocument;-><init>()V

    move-object/from16 v15, v16

    .line 1462
    invoke-virtual {v0, v2, v15, v12}, Lorg/djvu/DDocument;->Open(Ljava/lang/String;Landroid/os/Handler;I)Ljava/lang/String;

    move-result-object v17

    if-nez v17, :cond_1b

    .line 1463
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v12, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1464
    invoke-static {v13}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1c

    const/4 v7, 0x0

    const/4 v15, 0x0

    .line 1465
    invoke-static {v0, v7, v15}, Lcom/flyersoft/books/PDFReader;->createBitmapOfDjvuPage(Lorg/djvu/DDocument;ILandroid/util/DisplayMetrics;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1466
    invoke-static {v0, v2, v7}, Lcom/flyersoft/tools/A;->generateBookCovers(Landroid/graphics/Bitmap;Ljava/lang/String;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    goto :goto_a

    :cond_1b
    const/16 v16, 0x0

    return-object v16

    :catchall_4
    move-exception v0

    .line 1471
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1474
    :cond_1c
    :goto_a
    const-string v0, ".cbz"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    const-string v0, ".cbr"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    :cond_1d
    const/4 v15, 0x0

    .line 1475
    invoke-static {v2, v15, v15}, Lcom/flyersoft/tools/compress/BaseCompressor;->createCbzBookCover(Ljava/lang/String;Lcom/flyersoft/tools/compress/BaseCompressor;Ljava/lang/String;)V

    .line 1476
    new-instance v0, Lcom/flyersoft/books/ComicInfo;

    invoke-direct {v0, v2}, Lcom/flyersoft/books/ComicInfo;-><init>(Ljava/lang/String;)V

    .line 1477
    invoke-virtual {v0}, Lcom/flyersoft/books/ComicInfo;->isInited()Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 1478
    invoke-virtual {v0}, Lcom/flyersoft/books/ComicInfo;->getBookName()Ljava/lang/String;

    move-result-object v3

    .line 1479
    invoke-virtual {v0}, Lcom/flyersoft/books/ComicInfo;->getAuthor()Ljava/lang/String;

    move-result-object v14

    .line 1480
    iget-object v1, v0, Lcom/flyersoft/books/ComicInfo;->description:Ljava/lang/String;

    .line 1481
    iget-object v0, v0, Lcom/flyersoft/books/ComicInfo;->categories:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v6

    :cond_1e
    move-object v5, v6

    .line 1485
    new-instance v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    if-eqz v4, :cond_1f

    move-object v10, v11

    :cond_1f
    move-object v6, v13

    .line 1495
    const-string v13, ""

    move-object v4, v1

    move-object v1, v3

    move-object v3, v14

    const-string v14, ""

    const-string v7, ""

    const-string v11, ""

    const-string v12, ""

    move-object/from16 v9, p0

    invoke-direct/range {v0 .. v14}, Lcom/flyersoft/tools/BookDb$BookInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_20

    const/4 v1, 0x1

    .line 1502
    invoke-static {v0, v1}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    :cond_20
    return-object v0
.end method

.method private static createBookItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$BookInfo;
    .locals 18

    move-object/from16 v0, p0

    const/4 v1, 0x1

    .line 795
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->removeSortTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 796
    new-instance v3, Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 v2, 0x2

    .line 798
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v2, 0x4

    .line 799
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v2, 0x5

    .line 800
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v2, 0x6

    .line 801
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v2, 0x7

    .line 802
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v2, 0x8

    .line 803
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/16 v2, 0x9

    .line 804
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/16 v2, 0xa

    .line 805
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/16 v2, 0xb

    .line 806
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/16 v2, 0xc

    .line 807
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/16 v2, 0xd

    .line 808
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/16 v2, 0xe

    .line 809
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 810
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v3 .. v17}, Lcom/flyersoft/tools/BookDb$BookInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3
.end method

.method private static createNoteItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$NoteInfo;
    .locals 22

    move-object/from16 v0, p0

    .line 1290
    new-instance v1, Lcom/flyersoft/tools/BookDb$NoteInfo;

    const/4 v2, 0x0

    move-object v3, v1

    .line 1291
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1292
    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x2

    .line 1293
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    .line 1294
    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    const/4 v8, 0x5

    .line 1295
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    const/4 v9, 0x6

    .line 1296
    invoke-interface {v0, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    const/4 v11, 0x7

    .line 1297
    invoke-interface {v0, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    const/16 v12, 0x8

    .line 1298
    invoke-interface {v0, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    const/16 v13, 0x9

    .line 1299
    invoke-interface {v0, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    const/16 v15, 0xa

    .line 1300
    invoke-interface {v0, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/16 v4, 0xb

    .line 1301
    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0xc

    .line 1302
    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move/from16 v18, v1

    const/16 v1, 0xd

    .line 1303
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    move-object/from16 v19, v3

    move-object v3, v6

    move-wide/from16 v20, v13

    move-object v13, v4

    move v4, v7

    move-wide v6, v9

    move v9, v12

    move-object v12, v15

    if-lez v1, :cond_0

    const/4 v15, 0x1

    goto :goto_0

    :cond_0
    const/4 v15, 0x0

    :goto_0
    move-object v14, v5

    move v5, v8

    move v8, v11

    move-wide/from16 v10, v20

    const/16 v1, 0xe

    .line 1304
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    if-lez v1, :cond_1

    const/16 v16, 0x1

    goto :goto_1

    :cond_1
    const/16 v16, 0x0

    :goto_1
    const/16 v1, 0xf

    .line 1305
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    move/from16 v1, v18

    move-object/from16 v0, v19

    invoke-direct/range {v0 .. v17}, Lcom/flyersoft/tools/BookDb$NoteInfo;-><init>(ILjava/lang/String;Ljava/lang/String;IIJIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    .line 1307
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    const-string v2, ""

    if-nez v1, :cond_2

    iput-object v2, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    .line 1308
    :cond_2
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    if-nez v1, :cond_3

    iput-object v2, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    .line 1309
    :cond_3
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    if-nez v1, :cond_4

    iput-object v2, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 1310
    :cond_4
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bak:Ljava/lang/String;

    if-nez v1, :cond_5

    iput-object v2, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bak:Ljava/lang/String;

    :cond_5
    return-object v0
.end method

.method public static createSerialText(Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/String;
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1892
    :cond_0
    iget-object p0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-static {p0}, Lcom/flyersoft/tools/BookDb;->createSerialText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static createSerialText(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1896
    const-string v0, ">\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 1898
    const-string v2, "<"

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v2

    if-eq v2, v1, :cond_2

    sub-int v1, v0, v2

    const/4 v3, 0x1

    if-le v1, v3, :cond_2

    add-int/2addr v2, v3

    .line 1900
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1901
    invoke-static {p0}, Lcom/flyersoft/moonreaderp/PrefEditBook;->getSeriesIndex(Ljava/lang/String;)F

    move-result p0

    const/high16 v1, -0x40800000    # -1.0f

    .line 1902
    const-string v2, "]"

    cmpl-float v1, p0, v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, " ["

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string p0, ""

    .line 1903
    :goto_0
    const-string v1, ".0]"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1904
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x3

    const/4 v4, 0x0

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1905
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static decodeCollection(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookCollection;
    .locals 3

    .line 858
    const-string v0, "\n##"

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x8

    if-le v1, v2, :cond_0

    .line 860
    :try_start_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 861
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    const-string v2, "\n**"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 862
    const-string v2, "\n**1"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    .line 863
    new-instance v2, Lcom/flyersoft/tools/BookDb$BookCollection;

    invoke-direct {v2, v1, v0, p0}, Lcom/flyersoft/tools/BookDb$BookCollection;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static deleteAllStatistics()V
    .locals 3

    .line 244
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 245
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "statistics"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public static deleteBook(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)I
    .locals 2

    .line 359
    :try_start_0
    invoke-static {p0}, Lcom/flyersoft/tools/A;->removeFileFromAllShelfSorts(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 361
    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->updateShelfSortFromDelete(Lcom/flyersoft/tools/BookDb$BookInfo;Z)V

    :cond_0
    const/4 p1, 0x1

    .line 362
    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->setShelfUpdateState(I)V

    .line 363
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->clearAllBooks()V

    .line 364
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v0, "books"

    const-string v1, "lowerFilename=?"

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, v1, p0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 366
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p0, -0x1

    return p0
.end method

.method private static deleteErrorDb()V
    .locals 0

    return-void
.end method

.method public static deleteNotes(Ljava/lang/String;ZZ)V
    .locals 1

    .line 1279
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 1281
    :cond_0
    const-string v0, "notes"

    if-eqz p1, :cond_1

    .line 1282
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    const-string p2, "lowerFilename=? and note<>\'\' and bookmark=\'\'"

    invoke-virtual {p1, v0, p2, p0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    return-void

    :cond_1
    if-eqz p2, :cond_2

    .line 1284
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    const-string p2, "lowerFilename=? and note=\'\' and bookmark=\'\'"

    invoke-virtual {p1, v0, p2, p0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    return-void

    .line 1286
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    const-string p2, "lowerFilename=? and bookmark=\'\'"

    invoke-virtual {p1, v0, p2, p0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public static deleteOtherSameFilenameCacheNotes(Ljava/lang/String;)V
    .locals 8

    .line 149
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "%/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 149
    const-string v1, "notes"

    const/4 v2, 0x0

    const-string v3, "filename like ?"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 151
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 152
    :cond_0
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    .line 153
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 155
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 157
    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .line 158
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 159
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const-string v2, "notes"

    const-string v3, "lowerFilename=?"

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    return-void
.end method

.method public static deleteStatistics(Ljava/lang/String;)I
    .locals 3

    .line 236
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "statistics"

    const-string v2, "filename=?"

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, v2, p0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 238
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 p0, -0x1

    return p0
.end method

.method public static deletedNotesToText(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1696
    const-string v0, "\n"

    const-string v1, "0\n"

    if-nez p0, :cond_0

    .line 1697
    const-string p0, ""

    return-object p0

    .line 1698
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1700
    :try_start_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1701
    const-string v4, "#\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1702
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1703
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1704
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1705
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1706
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1707
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget v5, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1708
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v5, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1709
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1710
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1711
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v5, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1712
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1713
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1714
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1715
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1716
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1717
    const-string v3, "*DELETED*\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception p0

    .line 1722
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 1724
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static differentNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/BookDb$NoteInfo;)Z
    .locals 5

    .line 1855
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    iget-object v1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    iget-object v1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    iget v1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    iget-boolean v1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    iget-boolean v1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    if-ne v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    iget-boolean v1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    if-ne v0, v1, :cond_1

    iget-wide v0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide v2, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    iget p0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    iget p1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    if-eq p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static emptyDatabase()V
    .locals 5

    .line 1862
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1863
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "books"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1864
    :cond_0
    sget-object v0, Lcom/flyersoft/tools/A;->download_cache_path:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, v2, v1}, Lcom/flyersoft/tools/T;->getFolderFileList(Ljava/lang/String;ZZZZ)Ljava/util/ArrayList;

    move-result-object v0

    .line 1865
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1866
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1867
    :cond_2
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    if-eqz v2, :cond_3

    .line 1868
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    sget-object v3, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain;->handler:Landroid/os/Handler;

    const/16 v4, 0x3ef

    .line 1869
    invoke-virtual {v3, v4, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    .line 1868
    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1871
    :cond_3
    invoke-static {v1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    goto :goto_0

    .line 1873
    :cond_4
    invoke-static {}, Lcom/flyersoft/tools/A;->deleteAllShelfSortFiles()V

    .line 1874
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->clearAllBooks()V

    return-void
.end method

.method public static encodeCollection(Lcom/flyersoft/tools/BookDb$BookCollection;)Ljava/lang/String;
    .locals 2

    .line 855
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n##"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n**"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lcom/flyersoft/tools/BookDb$BookCollection;->multiType:Z

    if-eqz p0, :cond_0

    const-string p0, "1"

    goto :goto_0

    :cond_0
    const-string p0, "0"

    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static endTransition()V
    .locals 1

    .line 100
    sget-boolean v0, Lcom/flyersoft/tools/BookDb;->inTransition:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 104
    :try_start_0
    sput-boolean v0, Lcom/flyersoft/tools/BookDb;->inTransition:Z

    .line 105
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 106
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 108
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public static exportNotesToFile(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;",
            ">;)Z"
        }
    .end annotation

    .line 1728
    invoke-static {p0, p2}, Lcom/flyersoft/tools/BookDb;->exportNotesToText(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    .line 1729
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    if-lez p2, :cond_0

    .line 1730
    invoke-static {p1, p0}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static exportNotesToText(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    move-object/from16 v0, p1

    .line 1642
    const-string v1, "\n"

    .line 0
    const-string v2, "trim:"

    const-string v3, "indent:"

    .line 1642
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".pdf"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    .line 1643
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 1645
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const-string v7, "notes"

    const-string v9, "lowerFilename=?"

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/String;

    move-result-object v10

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v8, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v13}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1646
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v7

    if-lez v7, :cond_8

    const/4 v7, 0x0

    if-eqz v4, :cond_5

    .line 1648
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_8

    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v1, :cond_8

    .line 1649
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/flyersoft/books/PDFReader;->remotePdfNotes:Ljava/util/ArrayList;

    .line 1650
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1651
    invoke-static {v6}, Lcom/flyersoft/tools/BookDb;->createNoteItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$NoteInfo;

    move-result-object v1

    if-eqz v0, :cond_0

    .line 1652
    invoke-static {v1, v0}, Lcom/flyersoft/tools/BookDb;->noteInAnnots(Lcom/flyersoft/tools/BookDb$NoteInfo;Ljava/util/ArrayList;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 1654
    :cond_0
    iget-boolean v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    const/16 v16, 0x1

    goto :goto_1

    :cond_1
    iget-boolean v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    if-eqz v2, :cond_2

    const/4 v2, 0x2

    const/16 v16, 0x2

    goto :goto_1

    :cond_2
    iget-boolean v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-eqz v2, :cond_3

    const/4 v2, 0x3

    const/16 v16, 0x3

    goto :goto_1

    :cond_3
    const/16 v16, 0x0

    .line 1655
    :goto_1
    sget-object v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v8, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-wide v9, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide v11, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    iget v13, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v14, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    .line 1657
    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_4

    iget v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    goto :goto_2

    :cond_4
    iget v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    :goto_2
    move v15, v2

    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    move-object/from16 v19, v1

    move-object/from16 v17, v2

    move-object/from16 v18, v3

    .line 1655
    invoke-virtual/range {v8 .. v19}, Lcom/flyersoft/books/PDFReader;->addNewRemoteNote(JJIIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1662
    :cond_5
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v9, Ljava/io/File;

    move-object/from16 v10, p0

    invoke-direct {v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v9

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1663
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v3, Lcom/flyersoft/tools/A;->indentParagraph:Z

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1664
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-boolean v2, Lcom/flyersoft/tools/A;->trimBlankSpace:Z

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1665
    :cond_6
    :goto_3
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_8

    if-eqz v0, :cond_7

    .line 1666
    invoke-static {v6}, Lcom/flyersoft/tools/BookDb;->createNoteItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$NoteInfo;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/flyersoft/tools/BookDb;->noteInAnnots(Lcom/flyersoft/tools/BookDb$NoteInfo;Ljava/util/ArrayList;)Z

    move-result v2

    if-nez v2, :cond_7

    goto :goto_3

    .line 1668
    :cond_7
    const-string v2, "#\n"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    .line 1669
    :goto_4
    invoke-interface {v6}, Landroid/database/Cursor;->getColumnCount()I

    move-result v3

    if-ge v2, v3, :cond_6

    .line 1670
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v6, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, "<BR>"

    invoke-virtual {v8, v1, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 1675
    :cond_8
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    .line 1679
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_5

    :catch_1
    move-exception v0

    .line 1677
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_5
    if-eqz v4, :cond_9

    .line 1681
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_9

    .line 1682
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    invoke-virtual {v0}, Lcom/flyersoft/books/PDFReader;->pdfCreateTextFromNotes()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1684
    :cond_9
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAllBooks()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    .line 546
    sget-object v0, Lcom/flyersoft/tools/BookDb;->allBooks:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 547
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/flyersoft/tools/BookDb;->allBooksTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1e

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    .line 548
    sget-object v0, Lcom/flyersoft/tools/BookDb;->allBooks:Ljava/util/ArrayList;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 549
    invoke-static {v1, v1, v1, v0}, Lcom/flyersoft/tools/BookDb;->getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/BookDb;->allBooks:Ljava/util/ArrayList;

    .line 550
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/flyersoft/tools/BookDb;->allBooksTime:J

    .line 551
    sget-object v0, Lcom/flyersoft/tools/BookDb;->allBooks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static getAllGroupSubFiles(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1019
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1020
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1021
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1023
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 1024
    invoke-virtual {v3}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1025
    iget-object v4, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1026
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1029
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 1030
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    :goto_1
    if-lez v3, :cond_2

    .line 1031
    iget-object v4, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1032
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1033
    iget-object v4, v2, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    const/4 v4, 0x0

    .line 1034
    invoke-static {v2, v4}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    goto :goto_2

    .line 1036
    :cond_3
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    :cond_4
    return-object v0
.end method

.method public static getAllStatistics()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$ReadStatistics;",
            ">;"
        }
    .end annotation

    .line 217
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 218
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 221
    :try_start_0
    const-string v3, "statistics"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 222
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 223
    new-instance v3, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v2, 0x2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    const/4 v2, 0x3

    .line 224
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    const/4 v2, 0x4

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct/range {v3 .. v9}, Lcom/flyersoft/tools/BookDb$ReadStatistics;-><init>(Ljava/lang/String;JJLjava/lang/String;)V

    .line 225
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 227
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    .line 229
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    return-object v1
.end method

.method public static getBook(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Lcom/flyersoft/tools/BookDb$BookInfo;
    .locals 9

    .line 396
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 398
    :try_start_0
    const-string v2, "books"

    const-string v4, "lowerFilename=?"

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 399
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 400
    invoke-static {p0}, Lcom/flyersoft/tools/BookDb;->createBookItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object p1

    const-wide/16 v0, -0x1

    cmp-long v2, p2, v0

    if-eqz v2, :cond_1

    .line 401
    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    cmp-long v2, v0, p2

    if-nez v2, :cond_0

    .line 402
    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object p1

    .line 406
    :cond_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    .line 408
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;
    .locals 2

    const-wide/16 v0, -0x1

    .line 388
    invoke-static {p0, v0, v1}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;J)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object p0

    return-object p0
.end method

.method public static getBook(Ljava/lang/String;J)Lcom/flyersoft/tools/BookDb$BookInfo;
    .locals 1

    .line 392
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-static {v0, p0, p1, p2}, Lcom/flyersoft/tools/BookDb;->getBook(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object p0

    return-object p0
.end method

.method public static getBookCollection(IZZ)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZZ)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1979
    const-string v1, "category"

    const/4 v2, 0x0

    packed-switch p0, :pswitch_data_0

    return-object v0

    .line 1994
    :pswitch_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getRatingCollections()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    .line 1992
    :pswitch_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getFolderValues()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    :pswitch_2
    const/4 p0, 0x1

    .line 1990
    invoke-static {v1, p0}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    .line 1988
    :pswitch_3
    const-string p0, "author"

    invoke-static {p0, v2}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    .line 1983
    :pswitch_4
    sget-object p0, Lcom/flyersoft/tools/A;->shelf_sub_author:Ljava/lang/String;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    return-object v0

    :cond_0
    const/4 p0, 0x2

    .line 1986
    invoke-static {v1, p0}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    .line 1981
    :pswitch_5
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    const-string p1, "favorite"

    invoke-static {p0, p1, v2, p2}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;IZ)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getBookCount()I
    .locals 8

    .line 529
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "books"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 530
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    .line 531
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    const/4 v0, 0x0

    return v0
.end method

.method public static getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;
    .locals 10

    const-wide/16 v0, -0x1

    .line 372
    invoke-static {p0, v0, v1}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;J)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v1

    if-nez v1, :cond_1

    .line 375
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "tmpbooks"

    const-string v5, "lowerFilename=?"

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 376
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 377
    invoke-static {p0}, Lcom/flyersoft/tools/BookDb;->createBookItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v0

    move-object v1, v0

    .line 380
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 382
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    return-object v1
.end method

.method public static getBookmarks(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/A$Bookmark;",
            ">;"
        }
    .end annotation

    .line 1544
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1546
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "notes"

    const-string v5, "lowerFilename=? and bookmark<>\'\'"

    .line 1547
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v6

    const-string v9, "lastChapter, lastSplitIndex, lastPosition"

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    .line 1546
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1549
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    const/4 v3, 0x7

    const/16 v4, 0x9

    const/4 v5, 0x6

    const/4 v6, 0x5

    const/4 v7, 0x4

    const/16 v8, 0xa

    if-eqz v2, :cond_0

    .line 1550
    new-instance v9, Lcom/flyersoft/tools/A$Bookmark;

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 1551
    invoke-interface {v0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    int-to-long v14, v2

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    move-object/from16 v10, p0

    invoke-direct/range {v9 .. v18}, Lcom/flyersoft/tools/A$Bookmark;-><init>(Ljava/lang/String;Ljava/lang/String;IIJJI)V

    .line 1550
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1553
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 1556
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_5

    sget-object v0, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    move-object/from16 v10, p0

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1557
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v11

    const-string v12, "notes"

    const-string v14, "filename like ? and bookmark<>\'\'"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "%/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1558
    invoke-static {v10}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v15

    const-string v18, "lastChapter, lastSplitIndex, lastPosition"

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    .line 1557
    invoke-virtual/range {v11 .. v18}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    const/4 v2, 0x0

    .line 1561
    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    if-eqz v9, :cond_4

    const/4 v9, 0x2

    .line 1563
    invoke-interface {v0, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x1

    if-nez v2, :cond_1

    .line 1565
    invoke-static {v9}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_2

    move-object v2, v9

    goto :goto_2

    .line 1569
    :cond_1
    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    goto :goto_2

    :cond_2
    const/4 v11, 0x0

    :goto_2
    if-eqz v11, :cond_3

    .line 1572
    new-instance v19, Lcom/flyersoft/tools/A$Bookmark;

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v22

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    .line 1573
    invoke-interface {v0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    int-to-long v11, v9

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v26

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v28

    move-object/from16 v20, v10

    move-wide/from16 v24, v11

    invoke-direct/range {v19 .. v28}, Lcom/flyersoft/tools/A$Bookmark;-><init>(Ljava/lang/String;Ljava/lang/String;IIJJI)V

    move-object/from16 v9, v19

    .line 1572
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    move-object/from16 v10, p0

    goto :goto_1

    .line 1576
    :cond_4
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 1577
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_5

    .line 1578
    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->clearBookmarks(Ljava/lang/String;)V

    .line 1579
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/A$Bookmark;

    .line 1580
    invoke-static {v2}, Lcom/flyersoft/tools/BookDb;->addBookmark(Lcom/flyersoft/tools/A$Bookmark;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    .line 1584
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_5
    return-object v1
.end method

.method public static getBooks(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    .line 559
    const-string v3, "\n"

    .line 0
    const-string v4, "((book like \'%"

    const-string v5, "(("

    .line 559
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 562
    const-string v7, "favorite"

    .line 563
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->default_favorite_name:I

    invoke-static {v7}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 564
    const-string v7, "default_fav"

    goto :goto_0

    :cond_0
    move-object v7, v1

    :goto_0
    if-eqz p0, :cond_b

    .line 569
    const-string v8, "\'"

    if-eqz v7, :cond_1

    .line 570
    :try_start_0
    const-string v9, "\'\'"

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_6

    .line 573
    :cond_1
    :goto_1
    const-string v9, " like \'%\' || x\'0A\' || \'%\'"

    const-string v10, "=\'"

    if-nez v2, :cond_4

    if-eqz v0, :cond_3

    if-eqz p4, :cond_2

    .line 576
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 578
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    move-object v10, v0

    goto :goto_4

    .line 581
    :cond_4
    const-string v11, "%\') or (category like \'%"

    const-string v12, "%\')or (author like \'%"

    const-string v13, "%\') or (description like \'%"

    if-nez v0, :cond_5

    .line 582
    :try_start_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "%\'))"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 585
    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_6

    goto :goto_3

    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_3
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ") and ((book like \'%"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "%\')))"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 590
    :goto_4
    const-string v8, "books"

    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getSortField()Ljava/lang/String;

    move-result-object v14

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v7, p0

    invoke-virtual/range {v7 .. v14}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 592
    :cond_7
    :goto_5
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_a

    if-eqz p4, :cond_9

    const/4 v0, 0x6

    .line 594
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 595
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_8

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_7

    .line 596
    :cond_8
    invoke-static {v6, p0}, Lcom/flyersoft/tools/BookDb;->addBookToCollection(Ljava/util/ArrayList;Landroid/database/Cursor;)V

    goto :goto_5

    .line 598
    :cond_9
    invoke-static {v6, p0}, Lcom/flyersoft/tools/BookDb;->addBookToCollection(Ljava/util/ArrayList;Landroid/database/Cursor;)V

    goto :goto_5

    .line 600
    :cond_a
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-object v6

    .line 602
    :goto_6
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_b
    return-object v6
.end method

.method public static getBooks(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    .line 555
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-static {v0, p0, p1, p2, p3}, Lcom/flyersoft/tools/BookDb;->getBooks(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public static getCategoriesFromBooks(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation

    .line 766
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 767
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 770
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 771
    iget-object v7, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    const-string v8, "<"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 772
    iget-object v7, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    const-string v8, ">"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 773
    iget-object v7, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    iget-object v5, v5, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v5, v6

    invoke-virtual {v7, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 774
    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    if-nez v7, :cond_1

    const/4 v7, 0x0

    goto :goto_1

    .line 775
    :cond_1
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    :goto_1
    add-int/2addr v7, v6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    const/4 v4, 0x1

    goto :goto_0

    .line 780
    :cond_3
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 781
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v5, ")"

    const-string v7, " ("

    const-string v8, "category"

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 782
    new-instance v9, Lcom/flyersoft/tools/BookDb$BookCollection;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v9, v8, v3, v6}, Lcom/flyersoft/tools/BookDb$BookCollection;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    if-eqz v4, :cond_5

    .line 784
    new-instance v1, Lcom/flyersoft/tools/BookDb$BookCollection;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->shelf_all:I

    invoke-static {v3}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, v8, p0, v6}, Lcom/flyersoft/tools/BookDb$BookCollection;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5
    return-object v0
.end method

.method public static getDb()Landroid/database/sqlite/SQLiteDatabase;
    .locals 3

    .line 58
    :try_start_0
    sget-object v0, Lcom/flyersoft/tools/BookDb;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "mrbooks.db"

    if-nez v0, :cond_0

    .line 59
    :try_start_1
    new-instance v0, Lcom/flyersoft/tools/BookDb$BookDBHelper;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/flyersoft/tools/BookDb$BookDBHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/flyersoft/tools/BookDb;->mDbHelper:Lcom/flyersoft/tools/BookDb$BookDBHelper;

    .line 60
    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/BookDb;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    goto :goto_0

    .line 62
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_1

    .line 63
    new-instance v0, Lcom/flyersoft/tools/BookDb$BookDBHelper;

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/flyersoft/tools/BookDb$BookDBHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object v0, Lcom/flyersoft/tools/BookDb;->mDbHelper:Lcom/flyersoft/tools/BookDb$BookDBHelper;

    .line 64
    invoke-virtual {v0}, Lcom/flyersoft/tools/BookDb$BookDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/tools/BookDb;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 70
    :cond_1
    :goto_0
    sget-object v0, Lcom/flyersoft/tools/BookDb;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0

    :catch_0
    move-exception v0

    .line 67
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public static getDistinctValues(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 699
    invoke-static {p0, p1, p2, v0}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;IZ)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public static getDistinctValues(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;IZ)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "IZ)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation

    .line 704
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-nez p0, :cond_0

    goto/16 :goto_2

    .line 708
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "SELECT distinct "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " FROM books order by "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 709
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 710
    const-string v2, "favorite"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 714
    :cond_1
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_a

    .line 715
    invoke-interface {p0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 716
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    if-lez p2, :cond_8

    .line 718
    invoke-static {v4}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 719
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 720
    const-string v7, "#"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    goto :goto_1

    .line 722
    :cond_3
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    const/16 v8, 0x64

    if-le v7, v8, :cond_4

    goto :goto_1

    .line 724
    :cond_4
    const-string v7, "<"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    const/4 v8, 0x2

    if-eqz v7, :cond_6

    if-ne p2, v5, :cond_5

    goto :goto_1

    .line 727
    :cond_5
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-ne v7, v8, :cond_7

    goto :goto_1

    :cond_6
    if-ne p2, v8, :cond_7

    goto :goto_1

    .line 732
    :cond_7
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 733
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 734
    new-instance v7, Lcom/flyersoft/tools/BookDb$BookCollection;

    invoke-direct {v7, p1, v6, v5}, Lcom/flyersoft/tools/BookDb$BookCollection;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_8
    if-eqz v3, :cond_9

    .line 741
    const-string v5, "default_fav"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 742
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->default_favorite_name:I

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 743
    new-instance v5, Lcom/flyersoft/tools/BookDb$BookCollection;

    invoke-direct {v5, p1, v4, v6}, Lcom/flyersoft/tools/BookDb$BookCollection;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v6, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 745
    :cond_9
    new-instance v5, Lcom/flyersoft/tools/BookDb$BookCollection;

    invoke-direct {v5, p1, v4, v6}, Lcom/flyersoft/tools/BookDb$BookCollection;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 750
    :cond_a
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    if-eqz p3, :cond_b

    .line 757
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ne p0, v5, :cond_b

    .line 758
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/tools/BookDb$BookCollection;

    iget-object p0, p0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->default_favorite_name:I

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b

    .line 759
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_b
    :goto_2
    return-object v0
.end method

.method public static getDistinctValues(Ljava/lang/String;I)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation

    .line 696
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-static {v0, p0, p1}, Lcom/flyersoft/tools/BookDb;->getDistinctValues(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public static getDownloadBooks()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    .line 637
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 639
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "books"

    const-string v5, "downloadUrl<>\'\'"

    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getSortField()Ljava/lang/String;

    move-result-object v9

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 640
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 641
    invoke-static {v1, v0}, Lcom/flyersoft/tools/BookDb;->addBookToCollection(Ljava/util/ArrayList;Landroid/database/Cursor;)V

    goto :goto_0

    .line 643
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    .line 645
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v1
.end method

.method public static getFavName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 790
    const-string v0, "default_fav"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget p0, Lcom/flyersoft/moonreaderp/R$string;->default_favorite_name:I

    invoke-static {p0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static getFolderBooks(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    .line 659
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 660
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 662
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "books"

    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getSortField()Ljava/lang/String;

    move-result-object v9

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 663
    :cond_0
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x3

    .line 664
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 665
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 666
    invoke-static {v1, v0}, Lcom/flyersoft/tools/BookDb;->addBookToCollection(Ljava/util/ArrayList;Landroid/database/Cursor;)V

    goto :goto_0

    .line 668
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 670
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-object v1
.end method

.method public static getFolderBooks(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    .line 651
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 652
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 653
    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 654
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static getFolderValues()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation

    .line 676
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 677
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 679
    :cond_0
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 680
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "books"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 681
    :cond_1
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x2

    .line 682
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 683
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_1

    .line 684
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 685
    new-instance v4, Lcom/flyersoft/tools/BookDb$BookCollection;

    const-string v5, "filename"

    const/4 v6, 0x0

    invoke-direct {v4, v5, v3, v6}, Lcom/flyersoft/tools/BookDb$BookCollection;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 688
    :cond_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    .line 690
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_1
    return-object v1
.end method

.method public static getNotesCount()I
    .locals 8

    .line 1878
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "notes"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1879
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    return v0
.end method

.method public static getNotesHighlights(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 1159
    invoke-static {p0, p1, p2, v0}, Lcom/flyersoft/tools/BookDb;->getNotesHighlights(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V

    return-void
.end method

.method public static getNotesHighlights(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            ">;Z)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 1166
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 1167
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 1168
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1170
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookType()I

    move-result v4

    const/4 v5, 0x7

    if-ne v4, v5, :cond_0

    const-string v4, "lastPosition, lastChapter"

    goto :goto_0

    .line 1171
    :cond_0
    const-string v4, "lastChapter, lastSplitIndex, lastPosition"

    :goto_0
    move-object v12, v4

    .line 1173
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string v6, "notes"

    const-string v8, "lowerFilename=? and highlightLength>0"

    .line 1174
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v7, 0x0

    .line 1173
    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    .line 1175
    :cond_1
    :goto_1
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v13, ""

    const/16 v14, 0xb

    const/4 v15, 0x0

    if-eqz v5, :cond_8

    .line 1176
    :try_start_1
    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->createNoteItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$NoteInfo;

    move-result-object v5

    .line 1180
    :goto_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v15, v6, :cond_7

    .line 1181
    invoke-virtual {v2, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1182
    iget v7, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v8, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    if-ne v7, v8, :cond_6

    iget v7, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    iget v8, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    if-ne v7, v8, :cond_6

    iget v7, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    iget v8, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    if-ne v7, v8, :cond_6

    iget v7, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    iget v8, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    if-ne v7, v8, :cond_6

    .line 1185
    iget-wide v7, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide v9, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    cmp-long v11, v7, v9

    if-eqz v11, :cond_4

    iget-object v7, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    iget-object v8, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    .line 1186
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    iget-wide v7, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide v9, v5, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    sub-long/2addr v7, v9

    .line 1187
    invoke-static {v7, v8}, Ljava/lang/Math;->abs(J)J

    move-result-wide v7

    iget-object v9, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    const/16 v10, 0xa

    if-le v9, v10, :cond_2

    const/16 v10, 0x32

    goto :goto_3

    :cond_2
    iget-object v9, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v11, 0x6

    if-le v9, v11, :cond_3

    const/16 v10, 0x19

    :cond_3
    :goto_3
    int-to-long v9, v10

    cmp-long v11, v7, v9

    if-gez v11, :cond_6

    .line 1188
    :cond_4
    iget-object v6, v6, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_5

    goto :goto_1

    .line 1190
    :cond_5
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 1191
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_6
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 1199
    :cond_7
    :goto_4
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1200
    invoke-interface {v4, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 1201
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 1204
    :cond_8
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 1206
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-lez v4, :cond_a

    .line 1208
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v5

    :goto_5
    if-ltz v4, :cond_9

    .line 1209
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 1210
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "#"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-array v7, v5, [Ljava/lang/Object;

    aput-object v6, v7, v15

    invoke-static {v7}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    add-int/lit8 v4, v4, -0x1

    goto :goto_5

    .line 1212
    :cond_9
    invoke-static {v0, v15, v15}, Lcom/flyersoft/tools/BookDb;->deleteNotes(Ljava/lang/String;ZZ)V

    .line 1213
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1214
    invoke-static {v4, v15}, Lcom/flyersoft/tools/BookDb;->insertNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Z)J

    goto :goto_6

    .line 1217
    :cond_a
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_10

    sget-object v3, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    const/4 v3, 0x1

    .line 1218
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    const-string v6, "notes"

    const-string v8, "filename like ? and highlightLength>0"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "%/"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1219
    invoke-static {v0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v7, 0x0

    .line 1218
    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    const/4 v5, 0x0

    .line 1222
    :goto_7
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_e

    const/4 v6, 0x2

    .line 1224
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    if-nez v5, :cond_b

    .line 1226
    invoke-static {v6}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_c

    goto :goto_8

    .line 1230
    :cond_b
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    move-object v6, v5

    :goto_8
    const/4 v5, 0x1

    goto :goto_9

    :cond_c
    move-object v6, v5

    const/4 v5, 0x0

    :goto_9
    if-eqz v5, :cond_d

    .line 1233
    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->createNoteItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$NoteInfo;

    move-result-object v5

    .line 1234
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1235
    invoke-interface {v4, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d

    .line 1236
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d
    move-object v5, v6

    goto :goto_7

    .line 1239
    :cond_e
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 1240
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_10

    .line 1241
    invoke-static {v5, v15, v15}, Lcom/flyersoft/tools/BookDb;->deleteNotes(Ljava/lang/String;ZZ)V

    .line 1242
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1243
    iput-object v0, v4, Lcom/flyersoft/tools/BookDb$NoteInfo;->filename:Ljava/lang/String;

    .line 1244
    invoke-static {v4, v15}, Lcom/flyersoft/tools/BookDb;->insertNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Z)J

    goto :goto_a

    :cond_f
    if-eqz p3, :cond_10

    .line 1247
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 1248
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 1249
    invoke-static {v0, v1, v2, v15}, Lcom/flyersoft/tools/BookDb;->getNotesHighlights(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 1254
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_10
    return-void
.end method

.method public static getPDF_META(Lcom/radaee/pdf/Document;)Lcom/flyersoft/tools/BookDb$PDF_META;
    .locals 7

    .line 1512
    const-string v0, ", "

    new-instance v1, Lcom/flyersoft/tools/BookDb$PDF_META;

    invoke-direct {v1}, Lcom/flyersoft/tools/BookDb$PDF_META;-><init>()V

    if-eqz p0, :cond_6

    .line 1516
    :try_start_0
    const-string v2, "Title"

    invoke-virtual {p0, v2}, Lcom/radaee/pdf/Document;->GetMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1517
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1518
    iput-object v2, v1, Lcom/flyersoft/tools/BookDb$PDF_META;->title:Ljava/lang/String;

    .line 1519
    :cond_0
    const-string v2, "Author"

    invoke-virtual {p0, v2}, Lcom/radaee/pdf/Document;->GetMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1520
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1521
    iput-object v2, v1, Lcom/flyersoft/tools/BookDb$PDF_META;->author:Ljava/lang/String;

    .line 1522
    :cond_1
    const-string v2, "Subject"

    invoke-virtual {p0, v2}, Lcom/radaee/pdf/Document;->GetMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1523
    invoke-static {v2}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$PDF_META;->title:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$PDF_META;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1524
    :cond_2
    iput-object v2, v1, Lcom/flyersoft/tools/BookDb$PDF_META;->subject:Ljava/lang/String;

    .line 1525
    :cond_3
    const-string v2, "Keywords"

    invoke-virtual {p0, v2}, Lcom/radaee/pdf/Document;->GetMeta(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1526
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 1527
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1528
    :goto_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, -0x1

    const-string v5, "\n"

    if-eq v3, v4, :cond_4

    .line 1529
    :try_start_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 1530
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x2

    .line 1531
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 1533
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_5

    .line 1534
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1535
    :cond_5
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v1, Lcom/flyersoft/tools/BookDb$PDF_META;->category:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-object v1

    :catch_0
    move-exception p0

    .line 1538
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_6
    return-object v1
.end method

.method public static getRating(Lcom/flyersoft/tools/BookDb$BookInfo;)I
    .locals 1

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 1045
    :cond_0
    iget-object p0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p0

    if-gez p0, :cond_1

    goto :goto_0

    :cond_1
    move v0, p0

    :goto_0
    const/4 p0, 0x5

    if-le v0, p0, :cond_2

    return p0

    :cond_2
    return v0
.end method

.method public static getRatingCollections()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookCollection;",
            ">;"
        }
    .end annotation

    .line 1063
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x5

    :goto_0
    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    .line 1065
    new-instance v2, Lcom/flyersoft/tools/BookDb$BookCollection;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, ""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "rate"

    invoke-direct {v2, v5, v3, v4}, Lcom/flyersoft/tools/BookDb$BookCollection;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static getRatingText(I)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    if-gez p0, :cond_0

    const/4 p0, 0x0

    :cond_0
    const/4 v1, 0x5

    if-le p0, v1, :cond_1

    const/4 p0, 0x5

    .line 1055
    :cond_1
    const-string v2, ""

    :goto_0
    if-ge v0, p0, :cond_2

    .line 1056
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\u2605"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1057
    :cond_2
    :goto_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p0

    if-ge p0, v1, :cond_3

    .line 1058
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u2606"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_3
    return-object v2
.end method

.method public static getReadDateDetail(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$ReadStatistics;)Ljava/lang/String;
    .locals 17

    if-nez p1, :cond_0

    .line 1945
    invoke-static/range {p0 .. p0}, Lcom/flyersoft/tools/BookDb;->getSavedStatistics(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$ReadStatistics;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object/from16 v0, p1

    :goto_0
    if-eqz v0, :cond_6

    .line 1946
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6

    .line 1948
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getStatisticsDayOff()J

    move-result-wide v1

    .line 1949
    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v3

    .line 1950
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1951
    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-static {v0, v5}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v0

    .line 1952
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1953
    invoke-static {v5}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v6

    int-to-long v6, v6

    .line 1955
    const-string v8, "|"

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    .line 1956
    const-string v9, "@"

    invoke-virtual {v5, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    .line 1957
    const-string v10, "#"

    invoke-virtual {v5, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1958
    const-string v13, " "

    const-string v14, ""

    if-lez v8, :cond_3

    add-int/lit8 v8, v8, 0x1

    .line 1959
    :try_start_1
    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v8

    const-wide/16 p0, 0x1

    int-to-long v11, v8

    if-lez v9, :cond_1

    add-int/lit8 v9, v9, 0x1

    .line 1960
    invoke-virtual {v5, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v8

    goto :goto_2

    :cond_1
    const/4 v8, 0x0

    :goto_2
    long-to-float v9, v11

    move-wide v15, v1

    move-object v2, v0

    .line 1961
    invoke-static/range {p0 .. p1}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v0

    long-to-float v0, v0

    div-float/2addr v9, v0

    .line 1962
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v11, v12}, Lcom/flyersoft/tools/T;->formatInterval(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-lez v8, :cond_2

    .line 1964
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v11, Ljava/text/DecimalFormat;

    const-string v12, "0"

    invoke-direct {v11, v12}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    int-to-float v8, v8

    div-float/2addr v8, v9

    float-to-double v8, v8

    .line 1963
    invoke-virtual {v11, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1964
    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->getSpeedTagShort()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    :cond_2
    move-object v1, v14

    :goto_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_3
    move-wide v15, v1

    const-wide/16 p0, 0x1

    move-object v2, v0

    move-object v0, v14

    :goto_4
    if-lez v10, :cond_4

    .line 1967
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v5, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 1968
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {p0 .. p1}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v8
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    invoke-static {v6, v7}, Ljava/lang/Long;->signum(J)I

    mul-long v6, v6, v8

    add-long/2addr v6, v15

    :try_start_2
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "<br>"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v0, v2

    move-wide v1, v15

    goto/16 :goto_1

    .line 1970
    :cond_5
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 1972
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_6
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getReadDateRange(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$ReadStatistics;)Ljava/lang/String;
    .locals 13

    .line 1917
    const-string v0, "\n"

    if-nez p1, :cond_0

    .line 1918
    invoke-static {p0}, Lcom/flyersoft/tools/BookDb;->getSavedStatistics(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$ReadStatistics;

    move-result-object p1

    :cond_0
    if-eqz p1, :cond_4

    .line 1919
    iget-object p0, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_4

    .line 1921
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getStatisticsDayOff()J

    move-result-wide v1

    .line 1922
    invoke-static {}, Ljava/text/DateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object p0

    .line 1923
    iget-object v3, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    const/4 v4, 0x0

    invoke-virtual {v3, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1924
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    int-to-long v5, v3

    .line 1925
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    int-to-long v7, v0

    const-wide/16 v9, -0x1

    cmp-long v0, v5, v9

    if-nez v0, :cond_1

    move-object v0, p1

    goto :goto_0

    :cond_1
    long-to-int v0, v5

    .line 1926
    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v0

    int-to-long v3, v0

    cmp-long v0, v3, v9

    if-nez v0, :cond_2

    move-wide v5, v9

    goto :goto_1

    :cond_2
    long-to-int v0, v7

    add-int/lit8 v0, v0, 0x1

    .line 1927
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    int-to-long v5, p1

    :goto_1
    const-wide/16 v7, 0x1

    .line 1929
    invoke-static {v7, v8}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v11

    mul-long v3, v3, v11

    cmp-long p1, v5, v9

    if-eqz p1, :cond_3

    .line 1931
    invoke-static {v7, v8}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v7

    mul-long v5, v5, v7

    cmp-long p1, v5, v3

    if-eqz p1, :cond_3

    .line 1933
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    add-long/2addr v3, v1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " - "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-long/2addr v5, v1

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    add-long/2addr v3, v1

    .line 1935
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 1937
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getSavedBookCover(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 134
    :try_start_0
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 135
    const-string v1, "covers2"

    const-string v3, "filename=?"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 136
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    .line 137
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 138
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object p1

    .line 141
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 143
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getSavedStatistics(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Z)Lcom/flyersoft/tools/BookDb$ReadStatistics;
    .locals 8

    if-eqz p0, :cond_1

    .line 202
    :try_start_0
    const-string v1, "statistics"

    const-string v3, "filename=?"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 203
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    new-instance v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    const/4 v0, 0x1

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v0, 0x2

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/4 v0, 0x3

    .line 205
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    const/4 v0, 0x4

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct/range {v1 .. v7}, Lcom/flyersoft/tools/BookDb$ReadStatistics;-><init>(Ljava/lang/String;JJLjava/lang/String;)V

    .line 206
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return-object v1

    .line 209
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 211
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 213
    new-instance v0, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    const-wide/16 v4, 0x0

    const-string v6, ""

    const-wide/16 v2, 0x0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/flyersoft/tools/BookDb$ReadStatistics;-><init>(Ljava/lang/String;JJLjava/lang/String;)V

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    return-object v0
.end method

.method public static getSavedStatistics(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$ReadStatistics;
    .locals 2

    .line 197
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p0, v1}, Lcom/flyersoft/tools/BookDb;->getSavedStatistics(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Z)Lcom/flyersoft/tools/BookDb$ReadStatistics;

    move-result-object p0

    return-object p0
.end method

.method public static getSeriesName(Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/String;
    .locals 2

    .line 1883
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1884
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1885
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    iget-object p0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getSortField()Ljava/lang/String;
    .locals 2

    .line 610
    sget v0, Lcom/flyersoft/tools/A;->shelf_sort_by:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 614
    const-string v0, "book COLLATE NOCASE"

    return-object v0

    .line 613
    :cond_0
    const-string v0, "filename COLLATE NOCASE"

    return-object v0

    .line 612
    :cond_1
    const-string v0, "addTime desc"

    return-object v0

    .line 611
    :cond_2
    const-string v0, "author COLLATE NOCASE"

    return-object v0
.end method

.method public static getSortTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 821
    const-string v0, "#@#"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_0

    .line 822
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 823
    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method public static getStatisticsDayOff()J
    .locals 8

    .line 1912
    invoke-static {}, Lcom/flyersoft/tools/T;->getTodayStartMills()J

    move-result-wide v0

    invoke-static {}, Lcom/flyersoft/tools/T;->getTodayStartMills()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    invoke-static {v4, v5}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v6

    div-long/2addr v2, v6

    invoke-static {v4, v5}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v4

    mul-long v2, v2, v4

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public static hasSameBookByBookName(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 10

    const/4 v1, 0x0

    .line 428
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "books"

    const-string v5, "book=?"

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 429
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    .line 431
    :cond_0
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 432
    new-instance v3, Ljava/io/File;

    const/4 v4, 0x2

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 433
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 434
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v3

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    .line 437
    :cond_1
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 439
    :cond_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    if-eqz p2, :cond_3

    .line 440
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lez p0, :cond_3

    .line 441
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 442
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2

    const-string v0, "books"

    const-string v3, "filename=?"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, v3, p1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 443
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->clearAllBooks()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_3
    return v2

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 447
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v1
.end method

.method public static hasSameBookByFilename(Ljava/lang/String;)Z
    .locals 10

    const-string v0, "%/"

    const/4 v1, 0x0

    .line 416
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "books"

    const-string v5, "filename like ?"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 417
    invoke-static {p0}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    .line 416
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 418
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    .line 419
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 421
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v1
.end method

.method public static importNotesFromFile(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 1741
    invoke-static {p1}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/flyersoft/tools/BookDb;->importNotesFromText(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static importNotesFromText(Ljava/lang/String;Ljava/lang/String;)I
    .locals 33

    move-object/from16 v3, p0

    .line 1746
    const-string v0, "lowerFilename=? and lastChapter=? and lastSplitIndex=? and lastPosition=?"

    const/16 v18, -0x1

    :try_start_0
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".pdf"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    const/16 v19, 0x1

    if-eqz v1, :cond_1

    .line 1747
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    if-eqz v0, :cond_0

    .line 1748
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/books/PDFReader;->pdfCreateNotesFromText(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    return v19

    :cond_0
    return v18

    :cond_1
    move-object/from16 v1, p1

    .line 1753
    invoke-static {v1}, Lcom/flyersoft/tools/T;->String2InputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/T;->inputStream2StringList(Ljava/io/InputStream;)Ljava/util/ArrayList;

    move-result-object v1

    .line 1754
    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v4

    if-eqz v4, :cond_2

    return v18

    .line 1757
    :cond_2
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 1758
    invoke-static {v1, v2}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-long v6, v6

    sub-long/2addr v4, v6

    .line 1759
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    const-wide/32 v6, 0x186a0

    cmp-long v8, v4, v6

    if-lez v8, :cond_3

    const/4 v0, -0x2

    return v0

    .line 1764
    :cond_3
    sget-object v4, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1765
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    .line 1766
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    .line 1767
    sget-object v4, Lcom/flyersoft/tools/A;->bookmarkList:Ljava/util/ArrayList;

    .line 1768
    sget-object v5, Lcom/flyersoft/tools/A;->notes:Ljava/util/ArrayList;

    .line 1769
    sget-object v5, Lcom/flyersoft/tools/A;->highlights:Ljava/util/ArrayList;

    goto :goto_0

    .line 1771
    :cond_4
    invoke-static {v3}, Lcom/flyersoft/tools/BookDb;->getBookmarks(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 1772
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1773
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1774
    invoke-static {v3, v5, v6}, Lcom/flyersoft/tools/BookDb;->getNotesHighlights(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    move-object v5, v6

    :goto_0
    const/4 v6, 0x1

    const/16 v20, 0x0

    .line 1779
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_10

    .line 1780
    invoke-static {v1, v6}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v7

    const-string v8, "#"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    sub-int/2addr v7, v6

    const/16 v8, 0xf

    if-le v7, v8, :cond_f

    move-object v7, v0

    .line 1781
    new-instance v0, Lcom/flyersoft/tools/BookDb$NoteInfo;

    const/4 v8, 0x0

    .line 1783
    invoke-static {v3}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v9, v6, 0x5

    .line 1785
    invoke-static {v1, v9}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/lit8 v10, v6, 0x6

    .line 1786
    invoke-static {v1, v10}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/lit8 v11, v6, 0x7

    .line 1787
    invoke-static {v1, v11}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    add-int/lit8 v13, v6, 0x8

    .line 1788
    invoke-static {v1, v13}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    add-int/lit8 v14, v6, 0x9

    .line 1789
    invoke-static {v1, v14}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    add-int/lit8 v15, v6, 0xa

    .line 1790
    invoke-static {v1, v15}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    move-result-wide v15

    add-int/lit8 v8, v6, 0xb

    .line 1791
    invoke-static {v1, v8}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v17, v0

    add-int/lit8 v0, v6, 0xc

    .line 1792
    invoke-static {v1, v0}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v21, v0

    add-int/lit8 v0, v6, 0xd

    .line 1793
    invoke-static {v1, v0}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v22, v0

    add-int/lit8 v0, v6, 0xe

    .line 1794
    invoke-static {v1, v0}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    move-wide/from16 v31, v11

    move-object v12, v5

    move v5, v10

    move-wide v10, v15

    if-lez v0, :cond_5

    const/4 v15, 0x1

    goto :goto_2

    :cond_5
    const/4 v15, 0x0

    :goto_2
    move v0, v6

    move-object/from16 v16, v7

    move-wide/from16 v6, v31

    move/from16 v23, v0

    add-int/lit8 v0, v23, 0xf

    .line 1795
    invoke-static {v1, v0}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_6

    move-object/from16 v0, v16

    const/16 v16, 0x1

    goto :goto_3

    :cond_6
    move-object/from16 v0, v16

    const/16 v16, 0x0

    :goto_3
    move-object/from16 v24, v0

    add-int/lit8 v0, v23, 0x10

    move-object/from16 v23, v17

    .line 1796
    invoke-static {v1, v0}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v25, v1

    const/4 v1, 0x0

    move/from16 v27, v0

    move-object/from16 v28, v4

    move v4, v9

    move-object/from16 v29, v12

    move v9, v14

    move-object/from16 v14, v22

    move-object/from16 v0, v23

    move-object/from16 v30, v24

    move-object/from16 v26, v25

    move-object v12, v8

    move v8, v13

    move-object/from16 v13, v21

    invoke-direct/range {v0 .. v17}, Lcom/flyersoft/tools/BookDb$NoteInfo;-><init>(ILjava/lang/String;Ljava/lang/String;IIJIIJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    move-object/from16 v1, v26

    move/from16 v6, v27

    .line 1799
    invoke-static {v1, v6}, Lcom/flyersoft/tools/BookDb;->alGet(Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "*DELETED*"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 1801
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    const-string v8, "notes"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v4, v30

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1803
    iget-object v5, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v15, " and bookmark<>\'\'"

    const-string v9, ""

    if-lez v5, :cond_7

    move-object v5, v15

    goto :goto_4

    :cond_7
    move-object v5, v9

    :goto_4
    :try_start_1
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1804
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v11, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v13, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    filled-new-array {v3, v5, v11, v12}, [Ljava/lang/String;

    move-result-object v11

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v3, v9

    const/4 v9, 0x0

    const/4 v12, 0x0

    .line 1801
    invoke-virtual/range {v7 .. v14}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 1807
    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    move-result v7

    if-lez v7, :cond_8

    const/4 v7, 0x1

    goto :goto_5

    :cond_8
    const/4 v7, 0x0

    :goto_5
    if-eqz v7, :cond_c

    .line 1809
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 1810
    invoke-static {v5}, Lcom/flyersoft/tools/BookDb;->createNoteItem(Landroid/database/Cursor;)Lcom/flyersoft/tools/BookDb$NoteInfo;

    move-result-object v8

    if-nez v2, :cond_9

    .line 1811
    invoke-static {v0, v8}, Lcom/flyersoft/tools/BookDb;->differentNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    move-result v8

    if-eqz v8, :cond_c

    :cond_9
    if-eqz v2, :cond_a

    const/16 v20, 0x1

    .line 1815
    :cond_a
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7

    const-string v8, "notes"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1816
    iget-object v10, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_b

    goto :goto_6

    :cond_b
    move-object v15, v3

    :goto_6
    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1817
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v13, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v10, v11, v12, v3}, [Ljava/lang/String;

    move-result-object v3

    .line 1815
    invoke-virtual {v7, v8, v9, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    const/4 v7, 0x0

    .line 1820
    :cond_c
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    if-nez v2, :cond_d

    if-nez v7, :cond_d

    move-object/from16 v2, v28

    move-object/from16 v12, v29

    .line 1823
    invoke-static {v0, v2, v12}, Lcom/flyersoft/tools/BookDb;->confirmNoteNotExistAgain(Lcom/flyersoft/tools/BookDb$NoteInfo;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v3

    if-eqz v3, :cond_e

    const/4 v8, 0x0

    .line 1824
    invoke-static {v0, v8}, Lcom/flyersoft/tools/BookDb;->insertNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Z)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/16 v20, 0x1

    goto :goto_7

    :cond_d
    move-object/from16 v2, v28

    move-object/from16 v12, v29

    :cond_e
    const/4 v8, 0x0

    goto :goto_7

    :cond_f
    move-object v2, v4

    move-object v12, v5

    move/from16 v23, v6

    const/4 v8, 0x0

    move-object v4, v0

    move/from16 v6, v23

    :goto_7
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v3, p0

    move-object v0, v4

    move-object v5, v12

    move-object v4, v2

    const/4 v2, 0x0

    goto/16 :goto_1

    :cond_10
    if-eqz v20, :cond_11

    return v19

    :catch_0
    move-exception v0

    .line 1834
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_11
    return v18
.end method

.method public static insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J
    .locals 7

    .line 272
    const-string v0, "books"

    const-wide/16 v1, 0x0

    .line 274
    :try_start_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 275
    const-string v4, "book"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    const-string v4, "filename"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    const-string v4, "lowerFilename"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    const-string v4, "author"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    const-string v4, "description"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    const-string v4, "category"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    const-string v4, "thumbFile"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->thumbFile:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const-string v4, "coverFile"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->coverFile:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 283
    const-string v4, "addTime"

    if-eqz p1, :cond_0

    .line 284
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v3, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_0

    .line 286
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->addTime:Ljava/lang/String;

    invoke-virtual {v3, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    :goto_0
    const-string p1, "favorite"

    iget-object v4, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    invoke-virtual {v3, p1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    const-string p1, "downloadUrl"

    iget-object v4, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    invoke-virtual {v3, p1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    const-string p1, "rate"

    iget-object v4, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    invoke-virtual {v3, p1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    const-string p1, "bak1"

    iget-object v4, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    const-string p1, "bak2"

    iget-object v4, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    invoke-virtual {v3, p1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v4, "lowerFilename=?"

    iget-object p0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 294
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    .line 293
    invoke-virtual {p1, v0, v3, v4, p0}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    int-to-long p0, p0

    cmp-long v4, p0, v1

    if-nez v4, :cond_1

    .line 296
    :try_start_2
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/4 p0, 0x2

    .line 297
    :try_start_3
    invoke-static {p0}, Lcom/flyersoft/components/cloud/Sync;->setShelfUpdateState(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    :catch_0
    move-exception v0

    move-wide v1, p0

    move-object p0, v0

    goto :goto_1

    :catch_1
    move-exception p0

    .line 300
    :goto_1
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_2
    move-wide p0, v1

    .line 302
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->clearAllBooks()V

    return-wide p0
.end method

.method public static insertBookToTemp(Lcom/flyersoft/tools/BookDb$BookInfo;)J
    .locals 7

    .line 307
    const-string v0, "tmpbooks"

    const-wide/16 v1, 0x0

    .line 309
    :try_start_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 310
    const-string v4, "book"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    const-string v4, "filename"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    const-string v4, "lowerFilename"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    const-string v4, "author"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->author:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    const-string v4, "description"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->description:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    const-string v4, "category"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->category:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    const-string v4, "thumbFile"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->thumbFile:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    const-string v4, "coverFile"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->coverFile:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    const-string v4, "addTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 320
    const-string v4, "favorite"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->favorite:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    const-string v4, "downloadUrl"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->downloadUrl:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    const-string v4, "rate"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->rate:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    const-string v4, "bak1"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-static {v5}, Lcom/flyersoft/tools/T;->stringList2Text(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    const-string v4, "bak2"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v5, "lowerFilename=?"

    iget-object p0, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 327
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    .line 326
    invoke-virtual {v4, v0, v3, v5, p0}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    int-to-long v4, p0

    cmp-long p0, v4, v1

    if-nez p0, :cond_0

    .line 329
    :try_start_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-wide v0

    :catch_0
    move-exception p0

    move-wide v1, v4

    goto :goto_0

    :cond_0
    return-wide v4

    :catch_1
    move-exception p0

    .line 331
    :goto_0
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-wide v1
.end method

.method public static insertNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)J
    .locals 2

    const/4 v0, 0x1

    .line 1123
    invoke-static {p0, v0}, Lcom/flyersoft/tools/BookDb;->insertNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Z)J

    move-result-wide v0

    return-wide v0
.end method

.method public static insertNote(Lcom/flyersoft/tools/BookDb$NoteInfo;Z)J
    .locals 5

    const-wide/16 v0, 0x0

    if-eqz p0, :cond_4

    .line 1127
    iget-object v2, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->filename:Ljava/lang/String;

    if-nez v2, :cond_0

    goto/16 :goto_3

    .line 1130
    :cond_0
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 1131
    const-string v3, "book"

    iget-object v4, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->book:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1132
    const-string v3, "filename"

    iget-object v4, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1133
    iget-object v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->filename:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "lowerFilename"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1134
    iget v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "lastChapter"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1135
    iget v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "lastSplitIndex"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1136
    iget-wide v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v4, "lastPosition"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1137
    iget v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightLength:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "highlightLength"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1138
    iget v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->highlightColor:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "highlightColor"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    if-nez p1, :cond_2

    .line 1140
    iget-wide v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    cmp-long p1, v3, v0

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->time:J

    goto :goto_1

    :cond_2
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    :goto_1
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string v3, "time"

    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1141
    const-string p1, "bookmark"

    iget-object v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    invoke-virtual {v2, p1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1142
    const-string p1, "note"

    iget-object v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v2, p1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1143
    const-string p1, "original"

    iget-object v3, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v2, p1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1144
    iget-boolean p1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->underline:Z

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v3, "underline"

    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1145
    iget-boolean p1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->strikethrough:Z

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v3, "strikethrough"

    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1146
    iget-boolean p0, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->squiggly:Z

    if-eqz p0, :cond_3

    const-string p0, "1"

    goto :goto_2

    :cond_3
    const-string p0, "0"

    :goto_2
    const-string p1, "bak"

    invoke-virtual {v2, p1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1150
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    const-string p1, "notes"

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide p0

    :catch_0
    move-exception p0

    .line 1152
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    :goto_3
    return-wide v0
.end method

.method public static insertReadStatistics(Lcom/flyersoft/tools/BookDb$ReadStatistics;)J
    .locals 7

    .line 249
    const-string v0, "statistics"

    const-wide/16 v1, 0x0

    .line 251
    :try_start_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 252
    const-string v4, "filename"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    const-string v4, "usedTime"

    iget-wide v5, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 254
    const-string v4, "readWords"

    iget-wide v5, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWords:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 255
    const-string v4, "dates"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v5, "filename=?"

    iget-object p0, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, v0, v3, v5, p0}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    int-to-long v4, p0

    cmp-long p0, v4, v1

    if-nez p0, :cond_0

    .line 258
    :try_start_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-wide v0

    :catch_0
    move-exception p0

    move-wide v1, v4

    goto :goto_0

    :cond_0
    return-wide v4

    :catch_1
    move-exception p0

    .line 260
    :goto_0
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return-wide v1
.end method

.method public static moveBooksToNewPath(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$BookInfo;",
            ">;"
        }
    .end annotation

    .line 453
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllBooks()Ljava/util/ArrayList;

    move-result-object v0

    .line 454
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 455
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 456
    iget-object v4, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    .line 457
    const-string v5, "?"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_1

    const/4 v6, 0x0

    .line 458
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 459
    :cond_1
    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 460
    invoke-virtual {v5, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 461
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 462
    invoke-static {v6}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 463
    iget-object v4, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v4, v6}, Lcom/flyersoft/tools/BookDb;->changeBookFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    iget-object v4, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0, v4, v6}, Lcom/flyersoft/tools/BookDb;->changeGroupSubBooks(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 465
    iget-object v4, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v4, v6}, Lcom/flyersoft/tools/A;->renameHisotry(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 467
    :cond_2
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-le v6, v8, :cond_0

    .line 468
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 469
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 470
    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 471
    iget-object v5, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v5, v4}, Lcom/flyersoft/tools/BookDb;->changeBookFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 472
    iget-object v5, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v0, v5, v4}, Lcom/flyersoft/tools/BookDb;->changeGroupSubBooks(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    iget-object v5, v3, Lcom/flyersoft/tools/BookDb$BookInfo;->filename:Ljava/lang/String;

    invoke-static {v5, v4}, Lcom/flyersoft/tools/A;->renameHisotry(Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_3
    return-object v1
.end method

.method public static moveOldGroupToNewGroup(Lcom/flyersoft/tools/BookDb$BookInfo;Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;
    .locals 3

    .line 978
    invoke-virtual {p0}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 979
    sget-object v0, Lcom/flyersoft/tools/A;->listShelfBookCaches:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/BookDb$BookInfo;

    if-nez v0, :cond_0

    .line 981
    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    .line 983
    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    iput-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupName:Ljava/lang/String;

    .line 984
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 985
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 986
    iget-object v1, v0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 987
    iget-object p1, p0, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 988
    invoke-static {p0, v2}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 989
    invoke-static {v0, v2}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static noteExists(Ljava/lang/String;)Z
    .locals 8

    .line 344
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "notes"

    const/4 v2, 0x0

    const-string v3, "lowerFilename=?"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 345
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 346
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return v0
.end method

.method private static noteInAnnots(Lcom/flyersoft/tools/BookDb$NoteInfo;Ljava/util/ArrayList;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/tools/BookDb$NoteInfo;",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;",
            ">;)Z"
        }
    .end annotation

    .line 1688
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 1689
    iget v1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    iget v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    if-ne v1, v2, :cond_0

    iget v1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    iget v2, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    if-ne v1, v2, :cond_0

    iget-wide v1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    iget-wide v3, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->bookmark:Ljava/lang/String;

    .line 1690
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v1, :cond_2

    :cond_1
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    const/4 p0, 0x0

    return p0
.end method

.method public static removeBookmark(Lcom/flyersoft/tools/A$Bookmark;)Z
    .locals 11

    const-string v0, ""

    const/4 v1, 0x0

    .line 1604
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "notes"

    const-string v4, "lowerFilename=? and lastChapter=? and lastSplitIndex=? and lastPosition=? and bookmark<>\'\'"

    iget-object v5, p0, Lcom/flyersoft/tools/A$Bookmark;->filename:Ljava/lang/String;

    .line 1606
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v7, p0, Lcom/flyersoft/tools/A$Bookmark;->chapter:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v8, p0, Lcom/flyersoft/tools/A$Bookmark;->splitIndex:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v9, p0, Lcom/flyersoft/tools/A$Bookmark;->position:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {v5, v6, v7, p0}, [Ljava/lang/String;

    move-result-object p0

    .line 1604
    invoke-virtual {v2, v3, v4, p0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1

    :catch_0
    move-exception p0

    .line 1611
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v1
.end method

.method public static removeNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z
    .locals 11

    .line 1261
    const-string v0, "notes"

    .line 0
    const-string v1, ""

    const/4 v2, 0x0

    .line 1261
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "lowerFilename=? and lastChapter=? and lastSplitIndex=? and lastPosition=? and original=?"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->filename:Ljava/lang/String;

    .line 1263
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v7, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v8, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v9, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    filled-new-array {v5, v6, v7, v8, v9}, [Ljava/lang/String;

    move-result-object v5

    .line 1261
    invoke-virtual {v3, v0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 1266
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    const-string v4, "lowerFilename=? and lastChapter=? and lastSplitIndex=? and lastPosition=?"

    iget-object v5, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->filename:Ljava/lang/String;

    .line 1268
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v7, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastChapter:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v8, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastSplitIndex:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v9, p0, Lcom/flyersoft/tools/BookDb$NoteInfo;->lastPosition:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    filled-new-array {v5, v6, v7, p0}, [Ljava/lang/String;

    move-result-object p0

    .line 1266
    invoke-virtual {v3, v0, v4, p0}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    if-lez v3, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v2

    :catch_0
    move-exception p0

    .line 1273
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    return v2
.end method

.method public static removeSortTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 815
    const-string v0, "#@#"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_0

    .line 816
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static setBookCover(Ljava/lang/String;Ljava/lang/String;)J
    .locals 6

    .line 115
    const-string v0, "covers2"

    const-wide/16 v1, 0x0

    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_1

    .line 119
    :cond_0
    :try_start_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 120
    const-string v4, "filename"

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    const-string v4, "cover"

    invoke-virtual {v3, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const-string v4, "filename=?"

    .line 123
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    .line 122
    invoke-virtual {p1, v0, v3, v4, p0}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    int-to-long p0, p0

    cmp-long v4, p0, v1

    if-nez v4, :cond_1

    .line 125
    :try_start_1
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-wide p0

    :catch_0
    move-exception v0

    move-wide v1, p0

    goto :goto_0

    :cond_1
    return-wide p0

    :catch_1
    move-exception v0

    .line 127
    :goto_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    return-wide v1
.end method

.method public static statisticsExists(Ljava/lang/String;)Z
    .locals 8

    .line 351
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v1, "statistics"

    const/4 v2, 0x0

    const-string v3, "filename=?"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 352
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 353
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    return v0
.end method
