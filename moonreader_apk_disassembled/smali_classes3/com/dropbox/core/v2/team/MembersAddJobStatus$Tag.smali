.class public final enum Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;
.super Ljava/lang/Enum;
.source "MembersAddJobStatus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/MembersAddJobStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Tag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

.field public static final enum COMPLETE:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

.field public static final enum FAILED:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

.field public static final enum IN_PROGRESS:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 36
    new-instance v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    const-string v1, "IN_PROGRESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->IN_PROGRESS:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    .line 43
    new-instance v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    const-string v3, "COMPLETE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->COMPLETE:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    .line 48
    new-instance v3, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    const-string v5, "FAILED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->FAILED:Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    const/4 v5, 0x3

    .line 32
    new-array v5, v5, [Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;
    .locals 1

    .line 32
    const-class v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    return-object p0
.end method

.method public static values()[Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;
    .locals 1

    .line 32
    sget-object v0, Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->$VALUES:[Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    invoke-virtual {v0}, [Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/dropbox/core/v2/team/MembersAddJobStatus$Tag;

    return-object v0
.end method
