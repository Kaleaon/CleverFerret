.class public final enum Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;
.super Ljava/lang/Enum;
.source "DefinitionMarker.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

.field public static final enum ANY:Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

.field public static final enum COLON:Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

.field public static final enum TILDE:Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    const-string v1, "ANY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;->ANY:Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    const-string v3, "COLON"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;->COLON:Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    const-string v5, "TILDE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;->TILDE:Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    const/4 v5, 0x3

    .line 3
    new-array v5, v5, [Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;->$VALUES:[Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/options/DefinitionMarker;

    return-object v0
.end method
