.class final Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;
.super Lcom/flyersoft/staticlayout/SHTextHyphenator;
.source "SHTextHyphenator.java"


# instance fields
.field private am:Landroid/content/res/AssetManager;

.field private myLanguage:Ljava/lang/String;

.field private final myPatternTable:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;",
            "Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 666
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/SHTextHyphenator;-><init>()V

    .line 661
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myPatternTable:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/res/AssetManager;)V
    .locals 1

    .line 669
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/SHTextHyphenator;-><init>()V

    .line 661
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myPatternTable:Ljava/util/HashMap;

    .line 670
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->am:Landroid/content/res/AssetManager;

    return-void
.end method


# virtual methods
.method addPattern(Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;)V
    .locals 1

    .line 674
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myPatternTable:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public hyphenate([C[ZI)V
    .locals 8

    .line 720
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myPatternTable:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    :goto_0
    add-int/lit8 v0, p3, -0x1

    if-ge p1, v0, :cond_5

    .line 722
    aput-boolean v1, p2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    add-int/lit8 v0, p3, 0x1

    .line 727
    new-array v0, v0, [B

    .line 729
    iget-object v3, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myPatternTable:Ljava/util/HashMap;

    .line 730
    new-instance v4, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;

    invoke-direct {v4, p1, v1, p3, v1}, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;-><init>([CIIZ)V

    const/4 v5, 0x0

    :goto_1
    add-int/lit8 v6, p3, -0x1

    if-ge v5, v6, :cond_3

    sub-int v6, p3, v5

    add-int/lit8 v7, v6, 0x1

    .line 734
    invoke-virtual {v4, p1, v5, v6}, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->update([CII)V

    :cond_1
    :goto_2
    add-int/lit8 v7, v7, -0x1

    if-lez v7, :cond_2

    .line 736
    iput v7, v4, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myLength:I

    .line 737
    iput v1, v4, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->myHashCode:I

    .line 739
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;

    if-eqz v6, :cond_1

    .line 741
    invoke-virtual {v6, v0, v5}, Lcom/flyersoft/staticlayout/SHTextTeXHyphenationPattern;->apply([BI)V

    goto :goto_2

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    :goto_3
    if-ge p1, v6, :cond_5

    add-int/lit8 p3, p1, 0x1

    .line 747
    aget-byte v3, v0, p3

    rem-int/lit8 v3, v3, 0x2

    if-ne v3, v2, :cond_4

    const/4 v3, 0x1

    goto :goto_4

    :cond_4
    const/4 v3, 0x0

    :goto_4
    aput-boolean v3, p2, p1

    move p1, p3

    goto :goto_3

    :cond_5
    return-void
.end method

.method public load(Ljava/lang/String;)V
    .locals 4

    const-string v0, "hyphenation/"

    .line 678
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myLanguage:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/flyersoft/staticlayout/SHMiscUtil;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 681
    :cond_0
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myLanguage:Ljava/lang/String;

    .line 682
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->unload()V

    if-eqz p1, :cond_1

    .line 686
    :try_start_0
    new-instance v1, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;

    invoke-direct {v1, p0}, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;-><init>(Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;)V

    iget-object v2, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->am:Landroid/content/res/AssetManager;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->read(Ljava/io/InputStream;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 691
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public load(Ljava/lang/String;Landroid/content/res/AssetManager;)V
    .locals 3

    const-string v0, "hyphenation/"

    .line 697
    iget-object v1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myLanguage:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/flyersoft/staticlayout/SHMiscUtil;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 700
    :cond_0
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myLanguage:Ljava/lang/String;

    .line 701
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->unload()V

    if-eqz p1, :cond_1

    .line 705
    :try_start_0
    new-instance v1, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;

    invoke-direct {v1, p0}, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;-><init>(Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/flyersoft/staticlayout/SHTextHyphenationReader;->read(Ljava/io/InputStream;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 710
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public unload()V
    .locals 1

    .line 716
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHTextTeXHyphenator;->myPatternTable:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method
