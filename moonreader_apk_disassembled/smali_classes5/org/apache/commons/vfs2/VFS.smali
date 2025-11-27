.class public final Lorg/apache/commons/vfs2/VFS;
.super Ljava/lang/Object;
.source "VFS.java"


# static fields
.field private static instance:Lorg/apache/commons/vfs2/FileSystemManager;

.field private static uriStyle:Ljava/lang/Boolean;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createManager(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileSystemManager;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 60
    const-string v0, "vfs/create-manager.error"

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 61
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/vfs2/FileSystemManager;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 65
    :try_start_1
    const-string v3, "init"

    const/4 v4, 0x0

    move-object v5, v4

    check-cast v5, [Ljava/lang/Class;

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 66
    move-object v3, v4

    check-cast v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_0
    return-object v2

    :catch_1
    move-exception v1

    .line 75
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-direct {v2, v0, p0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v2

    :catch_2
    move-exception v1

    .line 73
    new-instance v2, Lorg/apache/commons/vfs2/FileSystemException;

    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v1

    invoke-direct {v2, v0, p0, v1}, Lorg/apache/commons/vfs2/FileSystemException;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static declared-synchronized getManager()Lorg/apache/commons/vfs2/FileSystemManager;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    const-class v0, Lorg/apache/commons/vfs2/VFS;

    monitor-enter v0

    .line 44
    :try_start_0
    sget-object v1, Lorg/apache/commons/vfs2/VFS;->instance:Lorg/apache/commons/vfs2/FileSystemManager;

    if-nez v1, :cond_0

    .line 45
    const-string v1, "org.apache.commons.vfs2.impl.StandardFileSystemManager"

    invoke-static {v1}, Lorg/apache/commons/vfs2/VFS;->createManager(Ljava/lang/String;)Lorg/apache/commons/vfs2/FileSystemManager;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/vfs2/VFS;->instance:Lorg/apache/commons/vfs2/FileSystemManager;

    .line 47
    :cond_0
    sget-object v1, Lorg/apache/commons/vfs2/VFS;->instance:Lorg/apache/commons/vfs2/FileSystemManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static isUriStyle()Z
    .locals 1

    .line 80
    sget-object v0, Lorg/apache/commons/vfs2/VFS;->uriStyle:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 81
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sput-object v0, Lorg/apache/commons/vfs2/VFS;->uriStyle:Ljava/lang/Boolean;

    .line 83
    :cond_0
    sget-object v0, Lorg/apache/commons/vfs2/VFS;->uriStyle:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static setManager(Lorg/apache/commons/vfs2/FileSystemManager;)V
    .locals 0

    .line 100
    sput-object p0, Lorg/apache/commons/vfs2/VFS;->instance:Lorg/apache/commons/vfs2/FileSystemManager;

    return-void
.end method

.method public static setUriStyle(Z)V
    .locals 1

    .line 87
    sget-object v0, Lorg/apache/commons/vfs2/VFS;->uriStyle:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-ne v0, p0, :cond_0

    goto :goto_0

    .line 88
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "VFS.uriStyle was already set differently."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 90
    :cond_1
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    sput-object p0, Lorg/apache/commons/vfs2/VFS;->uriStyle:Ljava/lang/Boolean;

    return-void
.end method
