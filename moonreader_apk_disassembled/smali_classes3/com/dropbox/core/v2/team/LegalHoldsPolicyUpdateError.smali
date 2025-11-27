.class public final enum Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;
.super Ljava/lang/Enum;
.source "LegalHoldsPolicyUpdateError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum EMPTY_MEMBERS_LIST:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum INACTIVE_LEGAL_HOLD:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum INVALID_MEMBERS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum LEGAL_HOLD_PERFORMING_ANOTHER_OPERATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum LEGAL_HOLD_POLICY_NOT_FOUND:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum NAME_MUST_BE_UNIQUE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum NUMBER_OF_USERS_ON_HOLD_IS_GREATER_THAN_HOLD_LIMITATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum OTHER:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

.field public static final enum UNKNOWN_LEGAL_HOLD_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 24
    new-instance v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const-string v1, "UNKNOWN_LEGAL_HOLD_ERROR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->UNKNOWN_LEGAL_HOLD_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 28
    new-instance v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const-string v3, "INSUFFICIENT_PERMISSIONS"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->INSUFFICIENT_PERMISSIONS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 36
    new-instance v3, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->OTHER:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 40
    new-instance v5, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const-string v7, "TRANSIENT_ERROR"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->TRANSIENT_ERROR:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 44
    new-instance v7, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const-string v9, "INACTIVE_LEGAL_HOLD"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->INACTIVE_LEGAL_HOLD:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 48
    new-instance v9, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const-string v11, "LEGAL_HOLD_PERFORMING_ANOTHER_OPERATION"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->LEGAL_HOLD_PERFORMING_ANOTHER_OPERATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 53
    new-instance v11, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const-string v13, "INVALID_MEMBERS"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->INVALID_MEMBERS:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 57
    new-instance v13, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const-string v15, "NUMBER_OF_USERS_ON_HOLD_IS_GREATER_THAN_HOLD_LIMITATION"

    const/16 v16, 0x0

    const/4 v2, 0x7

    invoke-direct {v13, v15, v2}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->NUMBER_OF_USERS_ON_HOLD_IS_GREATER_THAN_HOLD_LIMITATION:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 61
    new-instance v15, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const/16 v17, 0x7

    const-string v2, "EMPTY_MEMBERS_LIST"

    const/16 v18, 0x1

    const/16 v4, 0x8

    invoke-direct {v15, v2, v4}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->EMPTY_MEMBERS_LIST:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 65
    new-instance v2, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const/16 v19, 0x8

    const-string v4, "NAME_MUST_BE_UNIQUE"

    const/16 v20, 0x2

    const/16 v6, 0x9

    invoke-direct {v2, v4, v6}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->NAME_MUST_BE_UNIQUE:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    .line 70
    new-instance v4, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const/16 v21, 0x9

    const-string v6, "LEGAL_HOLD_POLICY_NOT_FOUND"

    const/16 v22, 0x3

    const/16 v8, 0xa

    invoke-direct {v4, v6, v8}, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->LEGAL_HOLD_POLICY_NOT_FOUND:Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    const/16 v6, 0xb

    .line 19
    new-array v6, v6, [Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    aput-object v0, v6, v16

    aput-object v1, v6, v18

    aput-object v3, v6, v20

    aput-object v5, v6, v22

    aput-object v7, v6, v10

    aput-object v9, v6, v12

    aput-object v11, v6, v14

    aput-object v13, v6, v17

    aput-object v15, v6, v19

    aput-object v2, v6, v21

    aput-object v4, v6, v8

    sput-object v6, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->$VALUES:[Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->$VALUES:[Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/LegalHoldsPolicyUpdateError;

    return-object v0
.end method
