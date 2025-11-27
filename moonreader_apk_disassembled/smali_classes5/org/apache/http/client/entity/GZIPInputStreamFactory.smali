.class public Lorg/apache/http/client/entity/GZIPInputStreamFactory;
.super Ljava/lang/Object;
.source "GZIPInputStreamFactory.java"

# interfaces
.implements Lorg/apache/http/client/entity/InputStreamFactory;


# static fields
.field private static final INSTANCE:Lorg/apache/http/client/entity/GZIPInputStreamFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    new-instance v0, Lorg/apache/http/client/entity/GZIPInputStreamFactory;

    invoke-direct {v0}, Lorg/apache/http/client/entity/GZIPInputStreamFactory;-><init>()V

    sput-object v0, Lorg/apache/http/client/entity/GZIPInputStreamFactory;->INSTANCE:Lorg/apache/http/client/entity/GZIPInputStreamFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/apache/http/client/entity/GZIPInputStreamFactory;
    .locals 1

    .line 56
    sget-object v0, Lorg/apache/http/client/entity/GZIPInputStreamFactory;->INSTANCE:Lorg/apache/http/client/entity/GZIPInputStreamFactory;

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

    .line 61
    new-instance v0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v0, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method
