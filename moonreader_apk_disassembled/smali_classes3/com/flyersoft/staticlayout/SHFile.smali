.class abstract Lcom/flyersoft/staticlayout/SHFile;
.super Ljava/lang/Object;
.source "SHTextHyphenator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/staticlayout/SHFile$ArchiveType;
    }
.end annotation


# static fields
.field private static final ourCachedFiles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/staticlayout/SHFile;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected myArchiveType:I

.field private myExtension:Ljava/lang/String;

.field private myIsCached:Z

.field private myShortName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flyersoft/staticlayout/SHFile;->ourCachedFiles:Ljava/util/HashMap;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFile(Lcom/flyersoft/staticlayout/SHFile;Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHFile;
    .locals 2

    if-nez p0, :cond_2

    .line 134
    sget-object p0, Lcom/flyersoft/staticlayout/SHFile;->ourCachedFiles:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/staticlayout/SHFile;

    if-eqz p0, :cond_0

    return-object p0

    .line 138
    :cond_0
    const-string p0, "/"

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    .line 139
    invoke-static {p1}, Lcom/flyersoft/staticlayout/SHResourceFile;->createResourceFile(Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;

    move-result-object p0

    return-object p0

    .line 141
    :cond_1
    new-instance p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;

    invoke-direct {p0, p1}, Lcom/flyersoft/staticlayout/SHPhysicalFile;-><init>(Ljava/lang/String;)V

    return-object p0

    .line 143
    :cond_2
    instance-of v0, p0, Lcom/flyersoft/staticlayout/SHPhysicalFile;

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->getParent()Lcom/flyersoft/staticlayout/SHFile;

    move-result-object v0

    if-nez v0, :cond_3

    .line 145
    new-instance v0, Lcom/flyersoft/staticlayout/SHPhysicalFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x2f

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/flyersoft/staticlayout/SHPhysicalFile;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 146
    :cond_3
    instance-of v0, p0, Lcom/flyersoft/staticlayout/SHResourceFile;

    if-eqz v0, :cond_4

    .line 147
    check-cast p0, Lcom/flyersoft/staticlayout/SHResourceFile;

    invoke-static {p0, p1}, Lcom/flyersoft/staticlayout/SHResourceFile;->createResourceFile(Lcom/flyersoft/staticlayout/SHResourceFile;Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;

    move-result-object v0

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    .line 152
    :goto_0
    sget-object p0, Lcom/flyersoft/staticlayout/SHFile;->ourCachedFiles:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_5

    if-eqz v0, :cond_5

    .line 153
    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/SHFile;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/staticlayout/SHFile;

    if-eqz p0, :cond_5

    return-object p0

    :cond_5
    return-object v0
.end method

.method public static createFileByPath(Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHFile;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 165
    :cond_0
    sget-object v0, Lcom/flyersoft/staticlayout/SHFile;->ourCachedFiles:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/staticlayout/SHFile;

    if-eqz v0, :cond_1

    return-object v0

    .line 170
    :cond_1
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 171
    invoke-static {p0}, Lcom/flyersoft/staticlayout/SHResourceFile;->createResourceFile(Ljava/lang/String;)Lcom/flyersoft/staticlayout/SHResourceFile;

    move-result-object p0

    return-object p0

    :cond_2
    const/16 v0, 0x3a

    .line 173
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    .line 179
    new-instance v0, Lcom/flyersoft/staticlayout/SHPhysicalFile;

    invoke-direct {v0, p0}, Lcom/flyersoft/staticlayout/SHPhysicalFile;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public final children()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/staticlayout/SHFile;",
            ">;"
        }
    .end annotation

    .line 217
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 218
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->directoryEntries()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 224
    :cond_0
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method

.method protected directoryEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/staticlayout/SHFile;",
            ">;"
        }
    .end annotation

    .line 213
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 237
    :cond_0
    instance-of v0, p1, Lcom/flyersoft/staticlayout/SHFile;

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 240
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->getPath()Ljava/lang/String;

    move-result-object v0

    check-cast p1, Lcom/flyersoft/staticlayout/SHFile;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/SHFile;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public abstract exists()Z
.end method

.method public final getExtension()Ljava/lang/String;
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHFile;->myExtension:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getInputStream()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getLongName()Ljava/lang/String;
.end method

.method public abstract getParent()Lcom/flyersoft/staticlayout/SHFile;
.end method

.method public abstract getPath()Ljava/lang/String;
.end method

.method public abstract getPhysicalFile()Lcom/flyersoft/staticlayout/SHPhysicalFile;
.end method

.method public final getShortName()Ljava/lang/String;
    .locals 1

    .line 205
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHFile;->myShortName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 229
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method protected init()V
    .locals 3

    .line 98
    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->getLongName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-lez v1, :cond_0

    add-int/lit8 v1, v1, 0x1

    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    iput-object v1, p0, Lcom/flyersoft/staticlayout/SHFile;->myExtension:Ljava/lang/String;

    const/16 v1, 0x2f

    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/staticlayout/SHFile;->myShortName:Ljava/lang/String;

    .line 116
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHFile;->myExtension:Ljava/lang/String;

    const-string v1, "zip"

    const/16 v2, 0x100

    if-ne v0, v1, :cond_1

    goto :goto_1

    .line 118
    :cond_1
    const-string v1, "oebzip"

    if-ne v0, v1, :cond_2

    goto :goto_1

    .line 120
    :cond_2
    const-string v1, "epub"

    if-ne v0, v1, :cond_3

    goto :goto_1

    .line 122
    :cond_3
    const-string v1, "tar"

    if-ne v0, v1, :cond_4

    const/16 v2, 0x200

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    .line 128
    :goto_1
    iput v2, p0, Lcom/flyersoft/staticlayout/SHFile;->myArchiveType:I

    return-void
.end method

.method public final isArchive()Z
    .locals 2

    .line 199
    iget v0, p0, Lcom/flyersoft/staticlayout/SHFile;->myArchiveType:I

    const v1, 0xff00

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected isCached()Z
    .locals 1

    .line 244
    iget-boolean v0, p0, Lcom/flyersoft/staticlayout/SHFile;->myIsCached:Z

    return v0
.end method

.method public final isCompressed()Z
    .locals 1

    .line 195
    iget v0, p0, Lcom/flyersoft/staticlayout/SHFile;->myArchiveType:I

    and-int/lit16 v0, v0, 0xff

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public abstract isDirectory()Z
.end method

.method public isReadable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setCached(Z)V
    .locals 1

    .line 248
    iput-boolean p1, p0, Lcom/flyersoft/staticlayout/SHFile;->myIsCached:Z

    if-eqz p1, :cond_0

    .line 250
    sget-object p1, Lcom/flyersoft/staticlayout/SHFile;->ourCachedFiles:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 252
    :cond_0
    sget-object p1, Lcom/flyersoft/staticlayout/SHFile;->ourCachedFiles:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/flyersoft/staticlayout/SHFile;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public abstract size()J
.end method
