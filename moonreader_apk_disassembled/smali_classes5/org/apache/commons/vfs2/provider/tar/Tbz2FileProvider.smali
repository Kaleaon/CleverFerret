.class public Lorg/apache/commons/vfs2/provider/tar/Tbz2FileProvider;
.super Lorg/apache/commons/vfs2/provider/CompositeFileProvider;
.source "Tbz2FileProvider.java"


# static fields
.field private static final SCHEMES:[Ljava/lang/String;

.field protected static final capabilities:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 29
    sget-object v0, Lorg/apache/commons/vfs2/provider/tar/TarFileProvider;->capabilities:Ljava/util/Collection;

    sput-object v0, Lorg/apache/commons/vfs2/provider/tar/Tbz2FileProvider;->capabilities:Ljava/util/Collection;

    .line 31
    const-string v0, "bz2"

    const-string v1, "tar"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/vfs2/provider/tar/Tbz2FileProvider;->SCHEMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Lorg/apache/commons/vfs2/provider/CompositeFileProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getCapabilities()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/apache/commons/vfs2/Capability;",
            ">;"
        }
    .end annotation

    .line 44
    sget-object v0, Lorg/apache/commons/vfs2/provider/tar/Tbz2FileProvider;->capabilities:Ljava/util/Collection;

    return-object v0
.end method

.method protected getSchemes()[Ljava/lang/String;
    .locals 1

    .line 39
    sget-object v0, Lorg/apache/commons/vfs2/provider/tar/Tbz2FileProvider;->SCHEMES:[Ljava/lang/String;

    return-object v0
.end method
