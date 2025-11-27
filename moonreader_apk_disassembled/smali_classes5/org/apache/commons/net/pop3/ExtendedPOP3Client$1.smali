.class synthetic Lorg/apache/commons/net/pop3/ExtendedPOP3Client$1;
.super Ljava/lang/Object;
.source "ExtendedPOP3Client.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/pop3/ExtendedPOP3Client;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 75
    invoke-static {}, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->values()[Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$1;->$SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD:[I

    :try_start_0
    sget-object v1, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->PLAIN:Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;

    invoke-virtual {v1}, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$1;->$SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD:[I

    sget-object v1, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->CRAM_MD5:Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;

    invoke-virtual {v1}, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
