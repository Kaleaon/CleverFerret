.class public Lorg/apache/http/entity/mime/UnexpectedMimeException;
.super Ljava/lang/RuntimeException;
.source "UnexpectedMimeException.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x124647444120c4dbL


# direct methods
.method public constructor <init>(Lorg/apache/james/mime4j/MimeException;)V
    .locals 1

    .line 42
    invoke-virtual {p1}, Lorg/apache/james/mime4j/MimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
