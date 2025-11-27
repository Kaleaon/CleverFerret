.class public final enum Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;
.super Ljava/lang/Enum;
.source "TokenGetAuthenticatedAdminError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

.field public static final enum ADMIN_NOT_ACTIVE:Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

.field public static final enum MAPPING_NOT_FOUND:Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 29
    new-instance v0, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    const-string v1, "MAPPING_NOT_FOUND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->MAPPING_NOT_FOUND:Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    .line 34
    new-instance v1, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    const-string v3, "ADMIN_NOT_ACTIVE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->ADMIN_NOT_ACTIVE:Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    .line 42
    new-instance v3, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->OTHER:Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    const/4 v5, 0x3

    .line 22
    new-array v5, v5, [Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->$VALUES:[Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;
    .locals 1

    .line 22
    const-class v0, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;
    .locals 1

    .line 22
    sget-object v0, Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->$VALUES:[Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/TokenGetAuthenticatedAdminError;

    return-object v0
.end method
