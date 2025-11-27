.class public Lcom/flyersoft/books/chmlib/TLV;
.super Ljava/lang/Object;
.source "TLV.java"


# instance fields
.field public tag:I

.field public values:[B


# direct methods
.method public constructor <init>(Lcom/flyersoft/books/chmlib/ByteBuffer;)V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readWORD()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/books/chmlib/TLV;->tag:I

    .line 11
    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readWORD()I

    move-result v0

    .line 12
    invoke-virtual {p1, v0}, Lcom/flyersoft/books/chmlib/ByteBuffer;->readBytes(I)[B

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/TLV;->values:[B

    return-void
.end method


# virtual methods
.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 19
    :try_start_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/TLV;->values:[B

    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2, p1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 21
    new-instance v0, Lcom/flyersoft/books/chmlib/ChmParseException;

    invoke-direct {v0, p1}, Lcom/flyersoft/books/chmlib/ChmParseException;-><init>(Ljava/lang/Exception;)V

    throw v0
.end method
