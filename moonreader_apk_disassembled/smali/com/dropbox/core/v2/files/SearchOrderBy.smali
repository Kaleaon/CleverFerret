.class public final enum Lcom/dropbox/core/v2/files/SearchOrderBy;
.super Ljava/lang/Enum;
.source "SearchOrderBy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SearchOrderBy$Serializer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/files/SearchOrderBy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/files/SearchOrderBy;

.field public static final enum LAST_MODIFIED_TIME:Lcom/dropbox/core/v2/files/SearchOrderBy;

.field public static final enum OTHER:Lcom/dropbox/core/v2/files/SearchOrderBy;

.field public static final enum RELEVANCE:Lcom/dropbox/core/v2/files/SearchOrderBy;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 21
    new-instance v0, Lcom/dropbox/core/v2/files/SearchOrderBy;

    const-string v1, "RELEVANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/SearchOrderBy;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/files/SearchOrderBy;->RELEVANCE:Lcom/dropbox/core/v2/files/SearchOrderBy;

    .line 22
    new-instance v1, Lcom/dropbox/core/v2/files/SearchOrderBy;

    const-string v3, "LAST_MODIFIED_TIME"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/files/SearchOrderBy;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/files/SearchOrderBy;->LAST_MODIFIED_TIME:Lcom/dropbox/core/v2/files/SearchOrderBy;

    .line 30
    new-instance v3, Lcom/dropbox/core/v2/files/SearchOrderBy;

    const-string v5, "OTHER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/files/SearchOrderBy;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/files/SearchOrderBy;->OTHER:Lcom/dropbox/core/v2/files/SearchOrderBy;

    const/4 v5, 0x3

    .line 19
    new-array v5, v5, [Lcom/dropbox/core/v2/files/SearchOrderBy;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/files/SearchOrderBy;->$VALUES:[Lcom/dropbox/core/v2/files/SearchOrderBy;

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

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SearchOrderBy;
    .locals 1

    .line 19
    const-class v0, Lcom/dropbox/core/v2/files/SearchOrderBy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/files/SearchOrderBy;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/files/SearchOrderBy;
    .locals 1

    .line 19
    sget-object v0, Lcom/dropbox/core/v2/files/SearchOrderBy;->$VALUES:[Lcom/dropbox/core/v2/files/SearchOrderBy;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/files/SearchOrderBy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/files/SearchOrderBy;

    return-object v0
.end method
