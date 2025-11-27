.class public Lorg/mydroid/droids/djvu/codec/DjvuOutline;
.super Ljava/lang/Object;
.source "DjvuOutline.java"


# instance fields
.field private docHandle:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static native expConsp(J)Z
.end method

.method private static native getChild(J)J
.end method

.method private static native getLink(JJ)Ljava/lang/String;
.end method

.method private static native getNext(J)J
.end method

.method private static native getTitle(J)Ljava/lang/String;
.end method

.method private static native open(J)J
.end method

.method private ttOutline(Ljava/util/List;JI)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/mydroid/core/codec/OutlineLink;",
            ">;JI)V"
        }
    .end annotation

    .line 22
    :goto_0
    invoke-static {p2, p3}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->expConsp(J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 23
    invoke-static {p2, p3}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->getTitle(J)Ljava/lang/String;

    move-result-object v2

    .line 24
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->docHandle:J

    invoke-static {p2, p3, v0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->getLink(JJ)Ljava/lang/String;

    move-result-object v3

    if-eqz v2, :cond_0

    .line 26
    new-instance v1, Lorg/mydroid/core/codec/OutlineLink;

    iget-wide v5, p0, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->docHandle:J

    const-string v7, ""

    move v4, p4

    invoke-direct/range {v1 .. v7}, Lorg/mydroid/core/codec/OutlineLink;-><init>(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    move v4, p4

    .line 28
    :goto_1
    invoke-static {p2, p3}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->getChild(J)J

    move-result-wide v0

    add-int/lit8 p4, v4, 0x1

    .line 29
    invoke-direct {p0, p1, v0, v1, p4}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->ttOutline(Ljava/util/List;JI)V

    .line 31
    invoke-static {p2, p3}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->getNext(J)J

    move-result-wide p2

    move p4, v4

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public getOutline(J)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lorg/mydroid/core/codec/OutlineLink;",
            ">;"
        }
    .end annotation

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    iput-wide p1, p0, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->docHandle:J

    .line 15
    invoke-static {p1, p2}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->open(J)J

    move-result-wide v1

    const/4 v3, 0x0

    .line 16
    invoke-direct {p0, v0, v1, v2, v3}, Lorg/mydroid/droids/djvu/codec/DjvuOutline;->ttOutline(Ljava/util/List;JI)V

    .line 17
    new-instance v4, Lorg/mydroid/core/codec/OutlineLink;

    const/4 v7, -0x1

    const-string v10, ""

    const-string v5, ""

    const-string v6, ""

    move-wide v8, p1

    invoke-direct/range {v4 .. v10}, Lorg/mydroid/core/codec/OutlineLink;-><init>(Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
