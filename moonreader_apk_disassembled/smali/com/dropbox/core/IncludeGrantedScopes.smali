.class public final enum Lcom/dropbox/core/IncludeGrantedScopes;
.super Ljava/lang/Enum;
.source "IncludeGrantedScopes.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/IncludeGrantedScopes;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/IncludeGrantedScopes;

.field public static final enum TEAM:Lcom/dropbox/core/IncludeGrantedScopes;

.field public static final enum USER:Lcom/dropbox/core/IncludeGrantedScopes;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 13
    new-instance v0, Lcom/dropbox/core/IncludeGrantedScopes;

    const-string v1, "USER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/IncludeGrantedScopes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/IncludeGrantedScopes;->USER:Lcom/dropbox/core/IncludeGrantedScopes;

    .line 17
    new-instance v1, Lcom/dropbox/core/IncludeGrantedScopes;

    const-string v3, "TEAM"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/IncludeGrantedScopes;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/IncludeGrantedScopes;->TEAM:Lcom/dropbox/core/IncludeGrantedScopes;

    const/4 v3, 0x2

    .line 9
    new-array v3, v3, [Lcom/dropbox/core/IncludeGrantedScopes;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    sput-object v3, Lcom/dropbox/core/IncludeGrantedScopes;->$VALUES:[Lcom/dropbox/core/IncludeGrantedScopes;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/IncludeGrantedScopes;
    .locals 1

    .line 9
    const-class v0, Lcom/dropbox/core/IncludeGrantedScopes;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/IncludeGrantedScopes;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/IncludeGrantedScopes;
    .locals 1

    .line 9
    sget-object v0, Lcom/dropbox/core/IncludeGrantedScopes;->$VALUES:[Lcom/dropbox/core/IncludeGrantedScopes;

    invoke-virtual {v0}, [Lcom/dropbox/core/IncludeGrantedScopes;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/IncludeGrantedScopes;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 21
    invoke-virtual {p0}, Lcom/dropbox/core/IncludeGrantedScopes;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
