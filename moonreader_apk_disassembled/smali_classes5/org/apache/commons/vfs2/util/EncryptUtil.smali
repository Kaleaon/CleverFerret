.class public final Lorg/apache/commons/vfs2/util/EncryptUtil;
.super Ljava/lang/Object;
.source "EncryptUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 39
    array-length v0, p0

    const/4 v1, 0x2

    const-string v2, "encrypt"

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    aget-object v0, p0, v3

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 40
    :cond_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Usage: \"EncryptUtil encrypt\" password"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 41
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "     password : The clear text password to encrypt"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 42
    invoke-static {v3}, Ljava/lang/System;->exit(I)V

    .line 44
    :cond_1
    invoke-static {}, Lorg/apache/commons/vfs2/util/CryptorFactory;->getCryptor()Lorg/apache/commons/vfs2/util/Cryptor;

    move-result-object v0

    .line 46
    aget-object v1, p0, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 47
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v2, 0x1

    aget-object p0, p0, v2

    invoke-interface {v0, p0}, Lorg/apache/commons/vfs2/util/Cryptor;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_2
    return-void
.end method
