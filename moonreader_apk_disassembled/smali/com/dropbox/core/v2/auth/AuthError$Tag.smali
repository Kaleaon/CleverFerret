.class public final enum Lcom/dropbox/core/v2/auth/AuthError$Tag;
.super Ljava/lang/Enum;
.source "AuthError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/auth/AuthError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/auth/AuthError$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/auth/AuthError$Tag;

.field public static final enum EXPIRED_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

.field public static final enum INVALID_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

.field public static final enum INVALID_SELECT_ADMIN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

.field public static final enum INVALID_SELECT_USER:Lcom/dropbox/core/v2/auth/AuthError$Tag;

.field public static final enum MISSING_SCOPE:Lcom/dropbox/core/v2/auth/AuthError$Tag;

.field public static final enum OTHER:Lcom/dropbox/core/v2/auth/AuthError$Tag;

.field public static final enum ROUTE_ACCESS_DENIED:Lcom/dropbox/core/v2/auth/AuthError$Tag;

.field public static final enum USER_SUSPENDED:Lcom/dropbox/core/v2/auth/AuthError$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 17

    .line 41
    new-instance v0, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    const-string v1, "INVALID_ACCESS_TOKEN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/auth/AuthError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/auth/AuthError$Tag;->INVALID_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    .line 46
    new-instance v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    const-string v3, "INVALID_SELECT_USER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/auth/AuthError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/auth/AuthError$Tag;->INVALID_SELECT_USER:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    .line 51
    new-instance v3, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    const-string v5, "INVALID_SELECT_ADMIN"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/auth/AuthError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/auth/AuthError$Tag;->INVALID_SELECT_ADMIN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    .line 55
    new-instance v5, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    const-string v7, "USER_SUSPENDED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/auth/AuthError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/auth/AuthError$Tag;->USER_SUSPENDED:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    .line 59
    new-instance v7, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    const-string v9, "EXPIRED_ACCESS_TOKEN"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/auth/AuthError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/auth/AuthError$Tag;->EXPIRED_ACCESS_TOKEN:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    .line 64
    new-instance v9, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    const-string v11, "MISSING_SCOPE"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/auth/AuthError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/auth/AuthError$Tag;->MISSING_SCOPE:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    .line 68
    new-instance v11, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    const-string v13, "ROUTE_ACCESS_DENIED"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/auth/AuthError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/auth/AuthError$Tag;->ROUTE_ACCESS_DENIED:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    .line 77
    new-instance v13, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    const-string v15, "OTHER"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/auth/AuthError$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/auth/AuthError$Tag;->OTHER:Lcom/dropbox/core/v2/auth/AuthError$Tag;

    const/16 v15, 0x8

    .line 37
    new-array v15, v15, [Lcom/dropbox/core/v2/auth/AuthError$Tag;

    aput-object v0, v15, v16

    aput-object v1, v15, v4

    aput-object v3, v15, v6

    aput-object v5, v15, v8

    aput-object v7, v15, v10

    aput-object v9, v15, v12

    aput-object v11, v15, v14

    aput-object v13, v15, v2

    sput-object v15, Lcom/dropbox/core/v2/auth/AuthError$Tag;->$VALUES:[Lcom/dropbox/core/v2/auth/AuthError$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/auth/AuthError$Tag;
    .locals 1

    .line 37
    const-class v0, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/auth/AuthError$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/auth/AuthError$Tag;
    .locals 1

    .line 37
    sget-object v0, Lcom/dropbox/core/v2/auth/AuthError$Tag;->$VALUES:[Lcom/dropbox/core/v2/auth/AuthError$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/auth/AuthError$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/auth/AuthError$Tag;

    return-object v0
.end method
