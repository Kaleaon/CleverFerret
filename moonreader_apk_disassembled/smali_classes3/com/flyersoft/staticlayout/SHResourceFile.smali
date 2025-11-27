.class abstract Lcom/flyersoft/staticlayout/SHResourceFile;
.super Lcom/flyersoft/staticlayout/SHFile;
.source "SHTextHyphenator.java"


# instance fields
.field private final myPath:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 409
    invoke-direct {p0}, Lcom/flyersoft/staticlayout/SHFile;-><init>()V

    .line 410
    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHResourceFile;->myPath:Ljava/lang/String;

    .line 411
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHResourceFile;->init()V

    return-void
.end method

.method static createResourceFile(Lcom/flyersoft/staticlayout/SHResourceFile;Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;
    .locals 1

    .line 404
    invoke-static {}, Lcom/flyersoft/staticlayout/SHLibrary;->Instance()Lcom/flyersoft/staticlayout/SHLibrary;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/flyersoft/staticlayout/SHLibrary;->createResourceFile(Lcom/flyersoft/staticlayout/SHResourceFile;Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;

    move-result-object p0

    return-object p0
.end method

.method public static createResourceFile(Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;
    .locals 1

    .line 400
    invoke-static {}, Lcom/flyersoft/staticlayout/SHLibrary;->Instance()Lcom/flyersoft/staticlayout/SHLibrary;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/flyersoft/staticlayout/SHLibrary;->createResourceFile(Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getLongName()Ljava/lang/String;
    .locals 2

    .line 421
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHResourceFile;->myPath:Ljava/lang/String;

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 416
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHResourceFile;->myPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPhysicalFile()Lcom/flyersoft/staticlayout/SHPhysicalFile;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
