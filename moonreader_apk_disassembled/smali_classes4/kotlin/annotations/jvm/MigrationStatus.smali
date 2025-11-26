.class public final enum Lkotlin/annotations/jvm/MigrationStatus;
.super Ljava/lang/Enum;
.source "MigrationStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lkotlin/annotations/jvm/MigrationStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lkotlin/annotations/jvm/MigrationStatus;

.field public static final enum IGNORE:Lkotlin/annotations/jvm/MigrationStatus;

.field public static final enum STRICT:Lkotlin/annotations/jvm/MigrationStatus;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum WARN:Lkotlin/annotations/jvm/MigrationStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 12
    new-instance v0, Lkotlin/annotations/jvm/MigrationStatus;

    const-string v1, "IGNORE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lkotlin/annotations/jvm/MigrationStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/annotations/jvm/MigrationStatus;->IGNORE:Lkotlin/annotations/jvm/MigrationStatus;

    .line 13
    new-instance v1, Lkotlin/annotations/jvm/MigrationStatus;

    const-string v3, "WARN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lkotlin/annotations/jvm/MigrationStatus;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lkotlin/annotations/jvm/MigrationStatus;->WARN:Lkotlin/annotations/jvm/MigrationStatus;

    .line 15
    new-instance v3, Lkotlin/annotations/jvm/MigrationStatus;

    const-string v5, "STRICT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lkotlin/annotations/jvm/MigrationStatus;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lkotlin/annotations/jvm/MigrationStatus;->STRICT:Lkotlin/annotations/jvm/MigrationStatus;

    const/4 v5, 0x3

    .line 11
    new-array v5, v5, [Lkotlin/annotations/jvm/MigrationStatus;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lkotlin/annotations/jvm/MigrationStatus;->$VALUES:[Lkotlin/annotations/jvm/MigrationStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 11
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lkotlin/annotations/jvm/MigrationStatus;
    .locals 1

    .line 11
    const-class v0, Lkotlin/annotations/jvm/MigrationStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkotlin/annotations/jvm/MigrationStatus;

    return-object p0
.end method

.method public static values()[Lkotlin/annotations/jvm/MigrationStatus;
    .locals 1

    .line 11
    sget-object v0, Lkotlin/annotations/jvm/MigrationStatus;->$VALUES:[Lkotlin/annotations/jvm/MigrationStatus;

    invoke-virtual {v0}, [Lkotlin/annotations/jvm/MigrationStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkotlin/annotations/jvm/MigrationStatus;

    return-object v0
.end method
