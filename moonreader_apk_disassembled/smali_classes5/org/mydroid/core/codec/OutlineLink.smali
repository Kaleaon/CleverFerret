.class public Lorg/mydroid/core/codec/OutlineLink;
.super Ljava/lang/Object;
.source "OutlineLink.java"

# interfaces
.implements Ljava/lang/CharSequence;


# instance fields
.field public docHandle:J

.field private level:I

.field private final link:Ljava/lang/String;

.field public linkUri:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p2, :cond_0

    .line 14
    const-string p2, ""

    .line 15
    :cond_0
    iput-object p1, p0, Lorg/mydroid/core/codec/OutlineLink;->title:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lorg/mydroid/core/codec/OutlineLink;->link:Ljava/lang/String;

    .line 17
    iput p3, p0, Lorg/mydroid/core/codec/OutlineLink;->level:I

    .line 18
    iput-wide p4, p0, Lorg/mydroid/core/codec/OutlineLink;->docHandle:J

    .line 19
    iput-object p6, p0, Lorg/mydroid/core/codec/OutlineLink;->linkUri:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public charAt(I)C
    .locals 1

    .line 30
    iget-object v0, p0, Lorg/mydroid/core/codec/OutlineLink;->title:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    return p1
.end method

.method public getLevel()I
    .locals 1

    .line 68
    iget v0, p0, Lorg/mydroid/core/codec/OutlineLink;->level:I

    return v0
.end method

.method public getLink()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lorg/mydroid/core/codec/OutlineLink;->link:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lorg/mydroid/core/codec/OutlineLink;->title:Ljava/lang/String;

    return-object v0
.end method

.method public length()I
    .locals 1

    .line 40
    iget-object v0, p0, Lorg/mydroid/core/codec/OutlineLink;->title:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public setLevel(I)V
    .locals 0

    .line 76
    iput p1, p0, Lorg/mydroid/core/codec/OutlineLink;->level:I

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lorg/mydroid/core/codec/OutlineLink;->title:Ljava/lang/String;

    return-void
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 1

    .line 50
    iget-object v0, p0, Lorg/mydroid/core/codec/OutlineLink;->title:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lorg/mydroid/core/codec/OutlineLink;->title:Ljava/lang/String;

    return-object v0
.end method
