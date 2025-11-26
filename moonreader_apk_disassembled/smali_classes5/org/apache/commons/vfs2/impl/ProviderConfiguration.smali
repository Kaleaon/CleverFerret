.class public Lorg/apache/commons/vfs2/impl/ProviderConfiguration;
.super Ljava/lang/Object;
.source "ProviderConfiguration.java"


# instance fields
.field private className:Ljava/lang/String;

.field private final dependenies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final schemes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/ProviderConfiguration;->schemes:Ljava/util/List;

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/vfs2/impl/ProviderConfiguration;->dependenies:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 1

    .line 36
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/ProviderConfiguration;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getDependencies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/ProviderConfiguration;->dependenies:Ljava/util/List;

    return-object v0
.end method

.method public getSchemes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/ProviderConfiguration;->schemes:Ljava/util/List;

    return-object v0
.end method

.method public isDefault()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setClassName(Ljava/lang/String;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lorg/apache/commons/vfs2/impl/ProviderConfiguration;->className:Ljava/lang/String;

    return-void
.end method

.method public setDependency(Ljava/lang/String;)V
    .locals 1

    .line 52
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/ProviderConfiguration;->dependenies:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public setScheme(Ljava/lang/String;)V
    .locals 1

    .line 44
    iget-object v0, p0, Lorg/apache/commons/vfs2/impl/ProviderConfiguration;->schemes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method
