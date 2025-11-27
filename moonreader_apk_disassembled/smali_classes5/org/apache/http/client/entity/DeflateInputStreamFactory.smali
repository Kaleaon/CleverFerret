.class public Lorg/apache/http/client/entity/DeflateInputStreamFactory;
.super Ljava/lang/Object;
.source "DeflateInputStreamFactory.java"

# interfaces
.implements Lorg/apache/http/client/entity/InputStreamFactory;


# static fields
.field private static final INSTANCE:Lorg/apache/http/client/entity/DeflateInputStreamFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    new-instance v0, Lorg/apache/http/client/entity/DeflateInputStreamFactory;

    invoke-direct {v0}, Lorg/apache/http/client/entity/DeflateInputStreamFactory;-><init>()V

    sput-object v0, Lorg/apache/http/client/entity/DeflateInputStreamFactory;->INSTANCE:Lorg/apache/http/client/entity/DeflateInputStreamFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/apache/http/client/entity/DeflateInputStreamFactory;
    .locals 1

    .line 55
    sget-object v0, Lorg/apache/http/client/entity/DeflateInputStreamFactory;->INSTANCE:Lorg/apache/http/client/entity/DeflateInputStreamFactory;

    return-object v0
.end method


# virtual methods
.method public create(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    new-instance v0, Lorg/apache/http/client/entity/DeflateInputStream;

    invoke-direct {v0, p1}, Lorg/apache/http/client/entity/DeflateInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method
