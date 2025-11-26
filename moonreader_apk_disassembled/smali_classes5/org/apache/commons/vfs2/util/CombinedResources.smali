.class public Lorg/apache/commons/vfs2/util/CombinedResources;
.super Ljava/util/ResourceBundle;
.source "CombinedResources.java"


# instance fields
.field private inited:Z

.field private final properties:Ljava/util/Properties;

.field private final resourceName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/util/ResourceBundle;-><init>()V

    .line 36
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->properties:Ljava/util/Properties;

    .line 39
    iput-object p1, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->resourceName:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/vfs2/util/CombinedResources;)Ljava/util/Properties;
    .locals 0

    .line 29
    iget-object p0, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->properties:Ljava/util/Properties;

    return-object p0
.end method


# virtual methods
.method public getKeys()Ljava/util/Enumeration;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 99
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->inited:Z

    if-nez v0, :cond_0

    .line 100
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/CombinedResources;->init()V

    .line 102
    :cond_0
    new-instance v0, Lorg/apache/commons/vfs2/util/CombinedResources$1;

    invoke-direct {v0, p0}, Lorg/apache/commons/vfs2/util/CombinedResources$1;-><init>(Lorg/apache/commons/vfs2/util/CombinedResources;)V

    return-object v0
.end method

.method public getResourceName()Ljava/lang/String;
    .locals 1

    .line 94
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->resourceName:Ljava/lang/String;

    return-object v0
.end method

.method protected handleGetObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 119
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->inited:Z

    if-nez v0, :cond_0

    .line 120
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/CombinedResources;->init()V

    .line 122
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->properties:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method protected init()V
    .locals 1

    .line 43
    iget-boolean v0, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->inited:Z

    if-eqz v0, :cond_0

    return-void

    .line 47
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/CombinedResources;->getResourceName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/util/CombinedResources;->loadResources(Ljava/lang/String;)V

    .line 48
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/util/CombinedResources;->loadResources(Ljava/util/Locale;)V

    .line 49
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/CombinedResources;->getLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/vfs2/util/CombinedResources;->loadResources(Ljava/util/Locale;)V

    const/4 v0, 0x1

    .line 50
    iput-boolean v0, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->inited:Z

    return-void
.end method

.method protected loadResources(Ljava/lang/String;)V
    .locals 4

    .line 73
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    if-nez v0, :cond_0

    .line 75
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 77
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".properties"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 79
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object p1

    .line 80
    :catch_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/URL;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 83
    :try_start_1
    iget-object v1, p0, Lorg/apache/commons/vfs2/util/CombinedResources;->properties:Ljava/util/Properties;

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_1
    :cond_1
    return-void
.end method

.method protected loadResources(Ljava/util/Locale;)V
    .locals 5

    if-nez p1, :cond_0

    goto :goto_2

    .line 57
    :cond_0
    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object p1

    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    move-result-object p1

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x3

    if-ge v2, v3, :cond_3

    .line 60
    invoke-virtual {p0}, Lorg/apache/commons/vfs2/util/CombinedResources;->getResourceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    :goto_1
    const/16 v4, 0x5f

    if-ge v3, v2, :cond_1

    .line 62
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    aget-object v4, p1, v3

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 64
    :cond_1
    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2

    .line 65
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    aget-object v3, p1, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/vfs2/util/CombinedResources;->loadResources(Ljava/lang/String;)V

    .line 68
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    :goto_2
    return-void
.end method
