.class public final enum Lcom/radaee/util/BookmarkHandler$BookmarkStatus;
.super Ljava/lang/Enum;
.source "BookmarkHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/BookmarkHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BookmarkStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/radaee/util/BookmarkHandler$BookmarkStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

.field public static final enum ALREADY_ADDED:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

.field public static final enum ERROR_UNKNOWN:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

.field public static final enum SUCCESS:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;


# direct methods
.method private static synthetic $values()[Lcom/radaee/util/BookmarkHandler$BookmarkStatus;
    .locals 3

    const/4 v0, 0x3

    .line 53
    new-array v0, v0, [Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    sget-object v1, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->SUCCESS:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->ALREADY_ADDED:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->ERROR_UNKNOWN:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 54
    new-instance v0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->SUCCESS:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    new-instance v0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    const-string v1, "ALREADY_ADDED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->ALREADY_ADDED:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    new-instance v0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    const-string v1, "ERROR_UNKNOWN"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->ERROR_UNKNOWN:Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    .line 53
    invoke-static {}, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->$values()[Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    move-result-object v0

    sput-object v0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->$VALUES:[Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 53
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/radaee/util/BookmarkHandler$BookmarkStatus;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 53
    const-class v0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    return-object p0
.end method

.method public static values()[Lcom/radaee/util/BookmarkHandler$BookmarkStatus;
    .locals 1

    .line 53
    sget-object v0, Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->$VALUES:[Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    invoke-virtual {v0}, [Lcom/radaee/util/BookmarkHandler$BookmarkStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/radaee/util/BookmarkHandler$BookmarkStatus;

    return-object v0
.end method
