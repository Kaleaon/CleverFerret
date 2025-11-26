.class public Lorg/mydroid/core/codec/EbookMeta;
.super Ljava/lang/Object;
.source "EbookMeta.java"


# instance fields
.field private annotation:Ljava/lang/String;

.field private author:Ljava/lang/String;

.field public coverImage:[B

.field private genre:Ljava/lang/String;

.field private isbn:Ljava/lang/String;

.field private keywords:Ljava/lang/String;

.field private lang:Ljava/lang/String;

.field private pagesCount:I

.field private publisher:Ljava/lang/String;

.field private sIndex:Ljava/lang/Integer;

.field private sequence:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private unzipPath:Ljava/lang/String;

.field private year:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/mydroid/core/codec/EbookMeta;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-virtual {p0, p1}, Lorg/mydroid/core/codec/EbookMeta;->updateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->title:Ljava/lang/String;

    .line 32
    invoke-virtual {p0, p2}, Lorg/mydroid/core/codec/EbookMeta;->updateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->author:Ljava/lang/String;

    .line 33
    invoke-virtual {p0, p3}, Lorg/mydroid/core/codec/EbookMeta;->updateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->sequence:Ljava/lang/String;

    .line 34
    invoke-virtual {p0, p4}, Lorg/mydroid/core/codec/EbookMeta;->updateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->genre:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-virtual {p0, p1}, Lorg/mydroid/core/codec/EbookMeta;->updateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->title:Ljava/lang/String;

    .line 22
    invoke-virtual {p0, p2}, Lorg/mydroid/core/codec/EbookMeta;->updateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->author:Ljava/lang/String;

    .line 23
    iput-object p3, p0, Lorg/mydroid/core/codec/EbookMeta;->coverImage:[B

    return-void
.end method

.method public static Empty()Lorg/mydroid/core/codec/EbookMeta;
    .locals 2

    .line 45
    new-instance v0, Lorg/mydroid/core/codec/EbookMeta;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1}, Lorg/mydroid/core/codec/EbookMeta;-><init>(Ljava/lang/String;Ljava/lang/String;[B)V

    return-object v0
.end method


# virtual methods
.method public getAnnotation()Ljava/lang/String;
    .locals 1

    .line 89
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->annotation:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthor()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->author:Ljava/lang/String;

    return-object v0
.end method

.method public getCoverImage()[B
    .locals 1

    .line 65
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->coverImage:[B

    return-object v0
.end method

.method public getGenre()Ljava/lang/String;
    .locals 1

    .line 81
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->genre:Ljava/lang/String;

    return-object v0
.end method

.method public getIsbn()Ljava/lang/String;
    .locals 1

    .line 153
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->isbn:Ljava/lang/String;

    return-object v0
.end method

.method public getKeywords()Ljava/lang/String;
    .locals 1

    .line 129
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->keywords:Ljava/lang/String;

    return-object v0
.end method

.method public getLang()Ljava/lang/String;
    .locals 1

    .line 113
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->lang:Ljava/lang/String;

    return-object v0
.end method

.method public getPagesCount()I
    .locals 1

    .line 121
    iget v0, p0, Lorg/mydroid/core/codec/EbookMeta;->pagesCount:I

    return v0
.end method

.method public getPublisher()Ljava/lang/String;
    .locals 1

    .line 145
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->publisher:Ljava/lang/String;

    return-object v0
.end method

.method public getSequence()Ljava/lang/String;
    .locals 1

    .line 73
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->sequence:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 49
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getUnzipPath()Ljava/lang/String;
    .locals 1

    .line 97
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->unzipPath:Ljava/lang/String;

    return-object v0
.end method

.method public getYear()Ljava/lang/String;
    .locals 1

    .line 137
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->year:Ljava/lang/String;

    return-object v0
.end method

.method public getsIndex()Ljava/lang/Integer;
    .locals 1

    .line 105
    iget-object v0, p0, Lorg/mydroid/core/codec/EbookMeta;->sIndex:Ljava/lang/Integer;

    return-object v0
.end method

.method public setAnnotation(Ljava/lang/String;)V
    .locals 0

    .line 93
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->annotation:Ljava/lang/String;

    return-void
.end method

.method public setAuthor(Ljava/lang/String;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->author:Ljava/lang/String;

    return-void
.end method

.method public setCoverImage([B)V
    .locals 0

    .line 69
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->coverImage:[B

    return-void
.end method

.method public setGenre(Ljava/lang/String;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->genre:Ljava/lang/String;

    return-void
.end method

.method public setIsbn(Ljava/lang/String;)V
    .locals 0

    .line 157
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->isbn:Ljava/lang/String;

    return-void
.end method

.method public setKeywords(Ljava/lang/String;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->keywords:Ljava/lang/String;

    return-void
.end method

.method public setLang(Ljava/lang/String;)V
    .locals 0

    .line 117
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->lang:Ljava/lang/String;

    return-void
.end method

.method public setPagesCount(I)V
    .locals 0

    .line 125
    iput p1, p0, Lorg/mydroid/core/codec/EbookMeta;->pagesCount:I

    return-void
.end method

.method public setPublisher(Ljava/lang/String;)V
    .locals 0

    .line 149
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->publisher:Ljava/lang/String;

    return-void
.end method

.method public setSequence(Ljava/lang/String;)V
    .locals 0

    .line 77
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->sequence:Ljava/lang/String;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->title:Ljava/lang/String;

    return-void
.end method

.method public setUnzipPath(Ljava/lang/String;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->unzipPath:Ljava/lang/String;

    return-void
.end method

.method public setYear(Ljava/lang/String;)V
    .locals 0

    .line 141
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->year:Ljava/lang/String;

    return-void
.end method

.method public setsIndex(Ljava/lang/Integer;)V
    .locals 0

    .line 109
    iput-object p1, p0, Lorg/mydroid/core/codec/EbookMeta;->sIndex:Ljava/lang/Integer;

    return-void
.end method

.method public updateString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-nez p1, :cond_0

    .line 39
    const-string p1, ""

    return-object p1

    .line 41
    :cond_0
    const-string v0, "  "

    const-string v1, " "

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
