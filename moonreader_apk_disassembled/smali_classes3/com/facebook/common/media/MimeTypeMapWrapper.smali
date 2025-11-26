.class public Lcom/facebook/common/media/MimeTypeMapWrapper;
.super Ljava/lang/Object;
.source "MimeTypeMapWrapper.java"


# static fields
.field private static final sExtensionToMimeTypeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sMimeTypeMap:Landroid/webkit/MimeTypeMap;

.field private static final sMimeTypeToExtensionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 20
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    sput-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sMimeTypeMap:Landroid/webkit/MimeTypeMap;

    .line 23
    const-string v0, "image/heif"

    const-string v1, "heif"

    const-string v2, "image/heic"

    const-string v3, "heic"

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v4

    sput-object v4, Lcom/facebook/common/media/MimeTypeMapWrapper;->sMimeTypeToExtensionMap:Ljava/util/Map;

    .line 28
    invoke-static {v1, v0, v3, v2}, Lcom/facebook/common/internal/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sExtensionToMimeTypeMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 33
    sget-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sMimeTypeToExtensionMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 37
    :cond_0
    sget-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sMimeTypeMap:Landroid/webkit/MimeTypeMap;

    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->getExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 41
    sget-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sExtensionToMimeTypeMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    return-object v0

    .line 45
    :cond_0
    sget-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sMimeTypeMap:Landroid/webkit/MimeTypeMap;

    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static hasExtension(Ljava/lang/String;)Z
    .locals 1

    .line 49
    sget-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sExtensionToMimeTypeMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sMimeTypeMap:Landroid/webkit/MimeTypeMap;

    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->hasExtension(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static hasMimeType(Ljava/lang/String;)Z
    .locals 1

    .line 53
    sget-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sMimeTypeToExtensionMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/facebook/common/media/MimeTypeMapWrapper;->sMimeTypeMap:Landroid/webkit/MimeTypeMap;

    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->hasMimeType(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method
