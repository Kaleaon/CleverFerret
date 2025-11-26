.class public Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;
.super Lorg/apache/commons/vfs2/FileSystemConfigBuilder;
.source "DefaultFileSystemConfigBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder$DefaultFileSystem;
    }
.end annotation


# static fields
.field private static final BUILDER:Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    new-instance v0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;

    invoke-direct {v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;-><init>()V

    sput-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lorg/apache/commons/vfs2/FileSystemConfigBuilder;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;
    .locals 1

    .line 38
    sget-object v0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;->BUILDER:Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;

    return-object v0
.end method


# virtual methods
.method protected getConfigClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/commons/vfs2/FileSystem;",
            ">;"
        }
    .end annotation

    .line 70
    const-class v0, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder$DefaultFileSystem;

    return-object v0
.end method

.method public getUserAuthenticator(Lorg/apache/commons/vfs2/FileSystemOptions;)Lorg/apache/commons/vfs2/UserAuthenticator;
    .locals 1

    .line 59
    const-string v0, "userAuthenticator"

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;->getParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/commons/vfs2/UserAuthenticator;

    return-object p1
.end method

.method public setUserAuthenticator(Lorg/apache/commons/vfs2/FileSystemOptions;Lorg/apache/commons/vfs2/UserAuthenticator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/vfs2/FileSystemException;
        }
    .end annotation

    .line 50
    const-string v0, "userAuthenticator"

    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/vfs2/impl/DefaultFileSystemConfigBuilder;->setParam(Lorg/apache/commons/vfs2/FileSystemOptions;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
