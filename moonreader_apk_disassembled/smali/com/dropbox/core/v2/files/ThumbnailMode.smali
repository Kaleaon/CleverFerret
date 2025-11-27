.class public final enum Lcom/dropbox/core/v2/files/ThumbnailMode;
.super Ljava/lang/Enum;
.source "ThumbnailMode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/ThumbnailMode$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/files/ThumbnailMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/files/ThumbnailMode;

.field public static final enum BESTFIT:Lcom/dropbox/core/v2/files/ThumbnailMode;

.field public static final enum FITONE_BESTFIT:Lcom/dropbox/core/v2/files/ThumbnailMode;

.field public static final enum STRICT:Lcom/dropbox/core/v2/files/ThumbnailMode;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/files/ThumbnailMode;

    const-string v1, "STRICT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/ThumbnailMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/files/ThumbnailMode;->STRICT:Lcom/dropbox/core/v2/files/ThumbnailMode;

    .line 28
    new-instance v1, Lcom/dropbox/core/v2/files/ThumbnailMode;

    const-string v3, "BESTFIT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/files/ThumbnailMode;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/files/ThumbnailMode;->BESTFIT:Lcom/dropbox/core/v2/files/ThumbnailMode;

    .line 32
    new-instance v3, Lcom/dropbox/core/v2/files/ThumbnailMode;

    const-string v5, "FITONE_BESTFIT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/files/ThumbnailMode;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/files/ThumbnailMode;->FITONE_BESTFIT:Lcom/dropbox/core/v2/files/ThumbnailMode;

    const/4 v5, 0x3

    .line 19
    new-array v5, v5, [Lcom/dropbox/core/v2/files/ThumbnailMode;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/files/ThumbnailMode;->$VALUES:[Lcom/dropbox/core/v2/files/ThumbnailMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ThumbnailMode;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/files/ThumbnailMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/files/ThumbnailMode;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/files/ThumbnailMode;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/files/ThumbnailMode;->$VALUES:[Lcom/dropbox/core/v2/files/ThumbnailMode;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/files/ThumbnailMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/files/ThumbnailMode;

    return-object v0
.end method
