.class public final enum Lcom/dropbox/core/v2/files/WriteMode$Tag;
.super Ljava/lang/Enum;
.source "WriteMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/WriteMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/files/WriteMode$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/files/WriteMode$Tag;

.field public static final enum ADD:Lcom/dropbox/core/v2/files/WriteMode$Tag;

.field public static final enum OVERWRITE:Lcom/dropbox/core/v2/files/WriteMode$Tag;

.field public static final enum UPDATE:Lcom/dropbox/core/v2/files/WriteMode$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 48
    new-instance v0, Lcom/dropbox/core/v2/files/WriteMode$Tag;

    const-string v1, "ADD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/files/WriteMode$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/files/WriteMode$Tag;->ADD:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    .line 53
    new-instance v1, Lcom/dropbox/core/v2/files/WriteMode$Tag;

    const-string v3, "OVERWRITE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/files/WriteMode$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/files/WriteMode$Tag;->OVERWRITE:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    .line 65
    new-instance v3, Lcom/dropbox/core/v2/files/WriteMode$Tag;

    const-string v5, "UPDATE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/files/WriteMode$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/files/WriteMode$Tag;->UPDATE:Lcom/dropbox/core/v2/files/WriteMode$Tag;

    const/4 v5, 0x3

    .line 42
    new-array v5, v5, [Lcom/dropbox/core/v2/files/WriteMode$Tag;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/files/WriteMode$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/WriteMode$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 42
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/files/WriteMode$Tag;
    .locals 1

    .line 42
    const-class v0, Lcom/dropbox/core/v2/files/WriteMode$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/files/WriteMode$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/files/WriteMode$Tag;
    .locals 1

    .line 42
    sget-object v0, Lcom/dropbox/core/v2/files/WriteMode$Tag;->$VALUES:[Lcom/dropbox/core/v2/files/WriteMode$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/files/WriteMode$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/files/WriteMode$Tag;

    return-object v0
.end method
