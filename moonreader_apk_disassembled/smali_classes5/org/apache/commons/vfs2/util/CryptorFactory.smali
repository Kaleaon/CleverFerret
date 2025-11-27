.class public final Lorg/apache/commons/vfs2/util/CryptorFactory;
.super Ljava/lang/Object;
.source "CryptorFactory.java"


# static fields
.field public static final CRYPTOR_CLASS:Ljava/lang/String; = "org.apache.commons.vfs2.cryptor"

.field private static instance:Lorg/apache/commons/vfs2/util/Cryptor;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getCryptor()Lorg/apache/commons/vfs2/util/Cryptor;
    .locals 6

    const-string v0, "Unable to create Cryptor "

    const-class v1, Lorg/apache/commons/vfs2/util/CryptorFactory;

    monitor-enter v1

    .line 55
    :try_start_0
    sget-object v2, Lorg/apache/commons/vfs2/util/CryptorFactory;->instance:Lorg/apache/commons/vfs2/util/Cryptor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 56
    monitor-exit v1

    return-object v2

    .line 59
    :cond_0
    :try_start_1
    const-string v2, "org.apache.commons.vfs2.cryptor"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_1

    .line 62
    :try_start_2
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 63
    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/vfs2/util/Cryptor;

    sput-object v3, Lorg/apache/commons/vfs2/util/CryptorFactory;->instance:Lorg/apache/commons/vfs2/util/Cryptor;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    monitor-exit v1

    return-object v3

    :catch_0
    move-exception v3

    .line 66
    :try_start_3
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 69
    :cond_1
    new-instance v0, Lorg/apache/commons/vfs2/util/DefaultCryptor;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/util/DefaultCryptor;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/util/CryptorFactory;->instance:Lorg/apache/commons/vfs2/util/Cryptor;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 70
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0
.end method

.method public static declared-synchronized setCryptor(Lorg/apache/commons/vfs2/util/Cryptor;)V
    .locals 1

    const-class v0, Lorg/apache/commons/vfs2/util/CryptorFactory;

    monitor-enter v0

    .line 45
    :try_start_0
    sput-object p0, Lorg/apache/commons/vfs2/util/CryptorFactory;->instance:Lorg/apache/commons/vfs2/util/Cryptor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method
