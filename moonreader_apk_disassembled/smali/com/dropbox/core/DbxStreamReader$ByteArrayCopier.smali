.class public final Lcom/dropbox/core/DbxStreamReader$ByteArrayCopier;
.super Lcom/dropbox/core/DbxStreamReader;
.source "DbxStreamReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/DbxStreamReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ByteArrayCopier"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/DbxStreamReader<",
        "Ljava/lang/RuntimeException;",
        ">;"
    }
.end annotation


# instance fields
.field private final data:[B

.field private final length:I

.field private final offset:I


# direct methods
.method public constructor <init>([B)V
    .locals 2

    const/4 v0, 0x0

    .line 63
    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/dropbox/core/DbxStreamReader$ByteArrayCopier;-><init>([BII)V

    return-void
.end method

.method public constructor <init>([BII)V
    .locals 2

    .line 52
    invoke-direct {p0}, Lcom/dropbox/core/DbxStreamReader;-><init>()V

    if-eqz p1, :cond_2

    if-ltz p2, :cond_1

    .line 54
    array-length v0, p1

    if-ge p2, v0, :cond_1

    add-int v0, p2, p3

    if-lt v0, p2, :cond_0

    .line 55
    array-length v1, p1

    if-gt v0, v1, :cond_0

    .line 56
    iput-object p1, p0, Lcom/dropbox/core/DbxStreamReader$ByteArrayCopier;->data:[B

    .line 57
    iput p2, p0, Lcom/dropbox/core/DbxStreamReader$ByteArrayCopier;->offset:I

    .line 58
    iput p3, p0, Lcom/dropbox/core/DbxStreamReader$ByteArrayCopier;->length:I

    return-void

    .line 55
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'offset+length\' is out of bounds"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 54
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'offset\' is out of bounds"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 53
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\'data\' can\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public read(Lcom/dropbox/core/NoThrowInputStream;)V
    .locals 3

    .line 69
    iget-object v0, p0, Lcom/dropbox/core/DbxStreamReader$ByteArrayCopier;->data:[B

    iget v1, p0, Lcom/dropbox/core/DbxStreamReader$ByteArrayCopier;->offset:I

    iget v2, p0, Lcom/dropbox/core/DbxStreamReader$ByteArrayCopier;->length:I

    invoke-virtual {p1, v0, v1, v2}, Lcom/dropbox/core/NoThrowInputStream;->read([BII)I

    return-void
.end method
