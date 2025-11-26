.class public Lcom/flyersoft/opds/N;
.super Ljava/lang/Object;
.source "N.java"


# static fields
.field public static final DELETE_CATALOG:Ljava/lang/String; = "delete_catalogs"

.field public static final DOWNLOAD_NEED_PASSWORD:I = 0xa

.field public static final NetLibrary_FILE_TAG:Ljava/lang/String; = "network2_"

.field public static final TYPE_ATOM:I = 0x2

.field public static final TYPE_BOOK:I = 0x0

.field public static final TYPE_WEB:I = 0x1

.field public static final USER_AGENT:Ljava/lang/String; = "OPDS/Stanza iPhone/Aldiko/Moon+ Reader(Android)"

.field public static isInited:Z = false

.field public static lastBookEntry:Lcom/flyersoft/opds/OpdsEntry;

.field private static libraries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsSite;",
            ">;"
        }
    .end annotation
.end field

.field private static libraryFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addNewCatalog(Lcom/flyersoft/moonreaderp/ActivityMain;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 277
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->add_catalog:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 278
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cat_name:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 279
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->cat_url:I

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 281
    const-string v4, ""

    iput-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain;->new_catalog_image:Ljava/lang/String;

    .line 282
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->sitebookImage:I

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 283
    invoke-static {v2}, Lcom/flyersoft/opds/N;->getLibraryImage(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 284
    new-instance v5, Lcom/flyersoft/opds/N$2;

    invoke-direct {v5, v4}, Lcom/flyersoft/opds/N$2;-><init>(Landroid/widget/ImageView;)V

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p2, :cond_0

    .line 301
    invoke-virtual {v1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    if-eqz p3, :cond_1

    goto :goto_0

    .line 304
    :cond_1
    sget-object p3, Lcom/flyersoft/tools/A;->last_catalog_url:Ljava/lang/String;

    :goto_0
    invoke-virtual {v3, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 305
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->cat_login_line:I

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/16 p3, 0x8

    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    .line 307
    new-instance p2, Lcom/flyersoft/components/MyDialog;

    invoke-direct {p2, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 308
    sget p3, Lcom/flyersoft/moonreaderp/R$string;->add_catalog:I

    invoke-virtual {p0, p3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p3

    invoke-virtual {p3, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p3

    new-instance v0, Lcom/flyersoft/opds/N$3;

    invoke-direct {v0, p0, v1, v3, v4}, Lcom/flyersoft/opds/N$3;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/ImageView;)V

    const v1, 0x104000a

    .line 309
    invoke-virtual {p3, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p3

    const/high16 v0, 0x1040000

    .line 323
    invoke-virtual {p3, v0, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    if-eqz p1, :cond_2

    .line 325
    new-instance p1, Lcom/flyersoft/opds/N$4;

    invoke-direct {p1, p0}, Lcom/flyersoft/opds/N$4;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    const-string p0, "Calibre IP"

    invoke-virtual {p2, p0, p1}, Lcom/flyersoft/components/MyDialog;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    .line 354
    :cond_2
    invoke-virtual {p2}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private static adjustItemImageManually(Lcom/flyersoft/opds/OpdsSite;)V
    .locals 3

    .line 132
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->baseUrl:Ljava/lang/String;

    .line 135
    const-string v1, "feedbooks.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 136
    const-string v0, "feedbooks.png"

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    return-void

    .line 137
    :cond_1
    const-string v1, "gutenberg.org"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v2, :cond_2

    .line 138
    const-string v0, "ProjectGutrnberg.png"

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    :cond_2
    :goto_0
    return-void
.end method

.method private static extractLibrariesFromAssets()V
    .locals 13

    .line 202
    const-string v0, "network2_"

    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 204
    :try_start_0
    sget-object v2, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    .line 205
    const-string v2, "network"

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_4

    aget-object v6, v2, v5

    .line 206
    const-string v7, ".xml"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    goto/16 :goto_1

    .line 209
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "network/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    .line 210
    invoke-static {v7}, Lcom/flyersoft/tools/T;->inputStream2String(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v8

    .line 211
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 213
    invoke-static {v8}, Lcom/flyersoft/opds/N;->getVer(Ljava/lang/String;)I

    move-result v7

    .line 215
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v10, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, -0x1

    if-ne v7, v10, :cond_1

    .line 217
    invoke-static {v9}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 218
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 221
    :cond_1
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x4

    invoke-virtual {v6, v4, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 222
    invoke-static {v9}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 224
    invoke-static {v9}, Lcom/flyersoft/tools/T;->getFileText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/flyersoft/opds/N;->getVer(Ljava/lang/String;)I

    move-result v10

    :cond_2
    if-le v7, v10, :cond_3

    .line 228
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v7

    const-string v10, "delete_catalogs"

    invoke-virtual {v7, v10, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    const-wide/16 v10, 0x0

    invoke-interface {v7, v6, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    cmp-long v12, v6, v10

    if-nez v12, :cond_3

    .line 229
    invoke-static {v9, v8}, Lcom/flyersoft/tools/T;->saveFileText(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    :catch_0
    move-exception v0

    .line 244
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    return-void
.end method

.method public static getLibraries()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsSite;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 52
    invoke-static {v0}, Lcom/flyersoft/opds/N;->getLibraries(Z)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getLibraries(Z)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsSite;",
            ">;"
        }
    .end annotation

    .line 55
    sget-object v0, Lcom/flyersoft/opds/N;->libraries:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    if-eqz p0, :cond_7

    .line 57
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 58
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    sput-object v2, Lcom/flyersoft/opds/N;->libraries:Ljava/util/ArrayList;

    if-eqz p0, :cond_1

    const/4 p0, 0x0

    .line 60
    sput-object p0, Lcom/flyersoft/opds/N;->libraryFiles:Ljava/util/ArrayList;

    .line 61
    :cond_1
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraryFiles()Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 62
    new-instance v4, Lcom/flyersoft/opds/OpdsSite;

    invoke-direct {v4}, Lcom/flyersoft/opds/OpdsSite;-><init>()V

    .line 64
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 65
    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    .line 66
    const-string v2, "site"

    const-string v6, ""

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->site:Ljava/lang/String;

    .line 67
    const-string v2, "title"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    .line 68
    const-string v2, "title_cn"

    iget-object v7, v4, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    invoke-interface {v5, v2, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->title_cn:Ljava/lang/String;

    .line 69
    const-string v2, "summary"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->summary:Ljava/lang/String;

    .line 70
    const-string v2, "summary_cn"

    iget-object v7, v4, Lcom/flyersoft/opds/OpdsSite;->summary:Ljava/lang/String;

    invoke-interface {v5, v2, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->summary_cn:Ljava/lang/String;

    .line 71
    const-string v2, "main"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    .line 72
    const-string v2, "baseUrl"

    iget-object v7, v4, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    invoke-interface {v5, v2, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->baseUrl:Ljava/lang/String;

    .line 73
    const-string v2, "search"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->searchUrl:Ljava/lang/String;

    .line 74
    const-string v2, "signIn"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->signInUrl:Ljava/lang/String;

    .line 75
    const-string v2, "signOut"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->signOutUrl:Ljava/lang/String;

    .line 76
    const-string v2, "username"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->username:Ljava/lang/String;

    .line 77
    const-string v2, "password"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getDecryptText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->password:Ljava/lang/String;

    .line 79
    const-string v2, "image"

    invoke-interface {v5, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    .line 80
    invoke-static {v4}, Lcom/flyersoft/opds/N;->adjustItemImageManually(Lcom/flyersoft/opds/OpdsSite;)V

    .line 85
    iget-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    invoke-static {v2}, Lcom/flyersoft/opds/N;->getUserAgent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v7, "useragent"

    invoke-interface {v5, v7, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->useragent:Ljava/lang/String;

    .line 87
    const-string v2, "cn_only"

    invoke-interface {v5, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v4, Lcom/flyersoft/opds/OpdsSite;->cn_only:Z

    .line 88
    const-string v2, "html"

    invoke-interface {v5, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v4, Lcom/flyersoft/opds/OpdsSite;->isHtml:Z

    .line 89
    const-string v2, "lock_search_url"

    invoke-interface {v5, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v4, Lcom/flyersoft/opds/OpdsSite;->lock_search_url:Z

    .line 92
    sget-boolean v2, Lcom/flyersoft/tools/A;->isChinese:Z

    if-eqz v2, :cond_3

    .line 93
    iget-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->title_cn:Ljava/lang/String;

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    .line 94
    iget-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->summary_cn:Ljava/lang/String;

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->summary:Ljava/lang/String;

    .line 97
    :cond_3
    iget-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 98
    iget-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    iput-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    .line 100
    :cond_4
    iget-object v2, v4, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 101
    sget-boolean v2, Lcom/flyersoft/tools/A;->isChinese:Z

    if-nez v2, :cond_5

    iget-boolean v2, v4, Lcom/flyersoft/opds/OpdsSite;->cn_only:Z

    if-nez v2, :cond_2

    .line 103
    :cond_5
    sget-object v2, Lcom/flyersoft/opds/N;->libraries:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 105
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "getLibraryFiles time:"

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v3

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 106
    invoke-static {v3}, Lcom/flyersoft/opds/N;->sortLibraryList(Z)V

    .line 109
    :cond_7
    sget-object p0, Lcom/flyersoft/opds/N;->libraries:Ljava/util/ArrayList;

    return-object p0
.end method

.method private static getLibrariesFromXmls()V
    .locals 9

    .line 168
    const-string v0, "network2_"

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/flyersoft/opds/N;->libraryFiles:Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 171
    :try_start_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v3, "netcatalog.txt"

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Lcom/flyersoft/tools/T;->inputStream2StringList(Ljava/io/InputStream;)Ljava/util/ArrayList;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 172
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_1

    const/4 v3, 0x0

    .line 173
    :goto_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 174
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 175
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 176
    sget-object v5, Lcom/flyersoft/opds/N;->libraryFiles:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x4

    invoke-virtual {v4, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    const/4 v2, 0x0

    .line 185
    :cond_1
    :try_start_1
    new-instance v3, Ljava/io/File;

    sget-object v4, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 186
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 188
    array-length v4, v3

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_4

    aget-object v6, v3, v5

    .line 189
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    .line 190
    invoke-virtual {v6, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    if-eqz v2, :cond_2

    .line 192
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    const/16 v8, 0x9

    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 191
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v7

    const/4 v8, -0x1

    if-ne v7, v8, :cond_3

    .line 193
    :cond_2
    sget-object v7, Lcom/flyersoft/opds/N;->libraryFiles:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x4

    invoke-virtual {v6, v1, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :catch_1
    move-exception v0

    .line 197
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_4
    return-void
.end method

.method private static getLibraryFiles()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 160
    sget-object v0, Lcom/flyersoft/opds/N;->libraryFiles:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 161
    invoke-static {}, Lcom/flyersoft/opds/N;->extractLibrariesFromAssets()V

    .line 162
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibrariesFromXmls()V

    .line 164
    :cond_0
    sget-object v0, Lcom/flyersoft/opds/N;->libraryFiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static getLibraryImage(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 149
    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 150
    invoke-static {p0}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    .line 151
    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 152
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "network/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lcom/flyersoft/tools/A;->getDrawableFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    if-nez v0, :cond_2

    .line 155
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p0

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->img_list_defaulticon:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_2
    return-object v0
.end method

.method public static getUserAgent(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 265
    const-string p0, "OPDS/Stanza iPhone/Aldiko/Moon+ Reader(Android)"

    return-object p0
.end method

.method private static getVer(Ljava/lang/String;)I
    .locals 4

    .line 250
    const-string v0, "\"version\" value=\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-eq v1, v2, :cond_0

    .line 252
    :try_start_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x11

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 253
    const-string v0, "\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 255
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    return v3
.end method

.method public static init(Z)V
    .locals 0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    .line 44
    sput-object p0, Lcom/flyersoft/opds/N;->libraryFiles:Ljava/util/ArrayList;

    .line 45
    sput-object p0, Lcom/flyersoft/opds/N;->libraries:Ljava/util/ArrayList;

    .line 47
    :cond_0
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    const/4 p0, 0x1

    .line 48
    sput-boolean p0, Lcom/flyersoft/opds/N;->isInited:Z

    return-void
.end method

.method public static openLibraryEditDialog(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/opds/OpdsSite;)V
    .locals 12

    .line 358
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->add_catalog:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 359
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cat_name:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/EditText;

    .line 360
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cat_url:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/EditText;

    .line 361
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cat_username:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/EditText;

    .line 362
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cat_password:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/EditText;

    .line 364
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->sitebookImage:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/ImageView;

    .line 365
    iget-object v1, p1, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/opds/N;->getLibraryImage(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v9, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 366
    new-instance v1, Lcom/flyersoft/opds/N$5;

    invoke-direct {v1, v9, p1}, Lcom/flyersoft/opds/N$5;-><init>(Landroid/widget/ImageView;Lcom/flyersoft/opds/OpdsSite;)V

    invoke-virtual {v9, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 382
    iget-object v1, p1, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 383
    const-string v1, "title"

    const-string v3, ""

    invoke-interface {v4, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 384
    const-string v1, "main"

    const-string v10, "https://"

    invoke-interface {v4, v1, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 385
    const-string v1, "username"

    invoke-interface {v4, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 386
    const-string v1, "password"

    invoke-interface {v4, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getDecryptText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 388
    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 389
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cat_login_line:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 391
    :cond_0
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    invoke-direct {v1, p0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->edit_catalog:I

    invoke-virtual {p0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v3, Lcom/flyersoft/opds/N$6;

    move-object v11, p0

    move-object v10, p1

    invoke-direct/range {v3 .. v11}, Lcom/flyersoft/opds/N$6;-><init>(Landroid/content/SharedPreferences;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/ImageView;Lcom/flyersoft/opds/OpdsSite;Lcom/flyersoft/moonreaderp/ActivityMain;)V

    const p0, 0x104000a

    .line 392
    invoke-virtual {v0, p0, v3}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    const/high16 p1, 0x1040000

    .line 406
    invoke-virtual {p0, p1, v2}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static siteExist(Ljava/lang/String;)Z
    .locals 3

    .line 270
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/opds/OpdsSite;

    .line 271
    iget-object v2, v2, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public static sortLibraryList(Z)V
    .locals 4

    .line 113
    invoke-static {}, Lcom/flyersoft/tools/A;->getLibraryTopItems()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 115
    :cond_0
    sget-object v0, Lcom/flyersoft/opds/N;->libraries:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/opds/OpdsSite;

    if-nez p0, :cond_2

    .line 116
    iget v2, v1, Lcom/flyersoft/opds/OpdsSite;->topId:I

    const/4 v3, -0x2

    if-ne v2, v3, :cond_1

    .line 117
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->getLibraryTopItems()Ljava/util/ArrayList;

    move-result-object v2

    iget-object v3, v1, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    iput v2, v1, Lcom/flyersoft/opds/OpdsSite;->topId:I

    goto :goto_0

    .line 119
    :cond_3
    :try_start_0
    sget-object p0, Lcom/flyersoft/opds/N;->libraries:Ljava/util/ArrayList;

    new-instance v0, Lcom/flyersoft/opds/N$1;

    invoke-direct {v0}, Lcom/flyersoft/opds/N$1;-><init>()V

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 127
    invoke-static {p0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method
