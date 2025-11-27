.class public Lorg/mydroid/droids/djvu/codec/DjvuContext;
.super Ljava/lang/Object;
.source "DjvuContext.java"


# instance fields
.field private contextHandle:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 5
    iput-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuContext;->contextHandle:J

    .line 15
    invoke-static {}, Lorg/mydroid/droids/djvu/codec/DjvuContext;->create()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuContext;->contextHandle:J

    return-void
.end method

.method private static native create()J
.end method

.method private static native free(J)V
.end method


# virtual methods
.method public final getContextHandle()J
    .locals 2

    .line 19
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuContext;->contextHandle:J

    return-wide v0
.end method

.method public openDocument(Ljava/lang/String;)Lorg/mydroid/droids/djvu/codec/DjvuDocument;
    .locals 1

    .line 8
    new-instance v0, Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    invoke-direct {v0, p0, p1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;-><init>(Lorg/mydroid/droids/djvu/codec/DjvuContext;Ljava/lang/String;)V

    return-object v0
.end method

.method public recycle()V
    .locals 5

    .line 24
    iget-wide v0, p0, Lorg/mydroid/droids/djvu/codec/DjvuContext;->contextHandle:J

    const-wide/16 v2, 0x0

    cmp-long v4, v2, v0

    if-eqz v4, :cond_0

    .line 26
    invoke-static {v0, v1}, Lorg/mydroid/droids/djvu/codec/DjvuContext;->free(J)V

    .line 27
    iput-wide v2, p0, Lorg/mydroid/droids/djvu/codec/DjvuContext;->contextHandle:J

    :cond_0
    return-void
.end method
