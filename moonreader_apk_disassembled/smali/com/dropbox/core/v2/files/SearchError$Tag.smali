.class public final enum Lcom/dropbox/core/v2/files/SearchError$Tag;
.super Ljava/lang/Enum;
.source "SearchError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/SearchError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/files/SearchError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/files/SearchError$Tag;

.field public static final enum INTERNAL_ERROR:Lcom/dropbox/core/v2/files/SearchError$Tag;

.field public static final enum INVALID_ARGUMENT:Lcom/dropbox/core/v2/files/SearchError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/files/SearchError$Tag;

.field public static final enum PATH:Lcom/dropbox/core/v2/files/SearchError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 36
    new-instance v0, Lcom/dropbox/core/v2/files/SearchError$Tag;

    const-string v1, "PATH"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/SearchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/files/SearchError$Tag;->PATH:Lcom/dropbox/core/v2/files/SearchError$Tag;

    .line 37
    new-instance v1, Lcom/dropbox/core/v2/files/SearchError$Tag;

    const-string v3, "INVALID_ARGUMENT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/files/SearchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/files/SearchError$Tag;->INVALID_ARGUMENT:Lcom/dropbox/core/v2/files/SearchError$Tag;

    .line 41
    new-instance v3, Lcom/dropbox/core/v2/files/SearchError$Tag;

    const-string v5, "INTERNAL_ERROR"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/files/SearchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/files/SearchError$Tag;->INTERNAL_ERROR:Lcom/dropbox/core/v2/files/SearchError$Tag;

    .line 50
    new-instance v5, Lcom/dropbox/core/v2/files/SearchError$Tag;

    const-string v7, "OTHER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/files/SearchError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/files/SearchError$Tag;->OTHER:Lcom/dropbox/core/v2/files/SearchError$Tag;

    const/4 v7, 0x4

    .line 35
    new-array v7, v7, [Lcom/dropbox/core/v2/files/SearchError$Tag;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/dropbox/core/v2/files/SearchError$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/SearchError$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchError$Tag;
    .locals 1

    .line 35
    const-class v0, Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/files/SearchError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/files/SearchError$Tag;
    .locals 1

    .line 35
    sget-object v0, Lcom/dropbox/core/v2/files/SearchError$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/SearchError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/files/SearchError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/files/SearchError$Tag;

    return-object v0
.end method
