.class final enum Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;
.super Ljava/lang/Enum;
.source "CSSParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "PseudoClassIdents"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum UNSUPPORTED:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum active:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field private static final cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum checked:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum disabled:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum empty:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum enabled:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum first_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum first_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum focus:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum hover:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum indeterminate:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum lang:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum last_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum last_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum link:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum not:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum nth_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum nth_last_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum nth_last_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum nth_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum only_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum only_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum root:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum target:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

.field public static final enum visited:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;
    .locals 3

    const/16 v0, 0x19

    .line 91
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->target:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->root:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_last_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_last_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->first_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->last_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->first_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->last_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->only_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->only_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->empty:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->not:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->lang:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->link:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->visited:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->hover:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->active:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->focus:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->enabled:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->disabled:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->checked:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->indeterminate:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->UNSUPPORTED:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 7

    .line 93
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "target"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->target:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 94
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "root"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->root:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 95
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "nth_child"

    const/4 v3, 0x2

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 96
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "nth_last_child"

    const/4 v3, 0x3

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_last_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 97
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "nth_of_type"

    const/4 v3, 0x4

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 98
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "nth_last_of_type"

    const/4 v3, 0x5

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->nth_last_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 99
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "first_child"

    const/4 v3, 0x6

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->first_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 100
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "last_child"

    const/4 v3, 0x7

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->last_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 101
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "first_of_type"

    const/16 v3, 0x8

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->first_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 102
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "last_of_type"

    const/16 v3, 0x9

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->last_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 103
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "only_child"

    const/16 v3, 0xa

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->only_child:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 104
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "only_of_type"

    const/16 v3, 0xb

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->only_of_type:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 105
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "empty"

    const/16 v3, 0xc

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->empty:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 106
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "not"

    const/16 v3, 0xd

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->not:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 110
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "lang"

    const/16 v3, 0xe

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->lang:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 111
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "link"

    const/16 v3, 0xf

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->link:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "visited"

    const/16 v3, 0x10

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->visited:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "hover"

    const/16 v3, 0x11

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->hover:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "active"

    const/16 v3, 0x12

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->active:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "focus"

    const/16 v3, 0x13

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->focus:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "enabled"

    const/16 v3, 0x14

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->enabled:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "disabled"

    const/16 v3, 0x15

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->disabled:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "checked"

    const/16 v3, 0x16

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->checked:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "indeterminate"

    const/16 v3, 0x17

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->indeterminate:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 126
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    const-string v1, "UNSUPPORTED"

    const/16 v3, 0x18

    invoke-direct {v0, v1, v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->UNSUPPORTED:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 91
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->$values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    .line 128
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->cache:Ljava/util/Map;

    .line 131
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    move-result-object v0

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 132
    sget-object v4, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->UNSUPPORTED:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    if-eq v3, v4, :cond_0

    .line 133
    invoke-virtual {v3}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->name()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x5f

    const/16 v6, 0x2d

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 134
    sget-object v5, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->cache:Ljava/util/Map;

    invoke-interface {v5, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
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

    .line 91
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;
    .locals 1

    .line 141
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->cache:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    if-eqz p0, :cond_0

    return-object p0

    .line 145
    :cond_0
    sget-object p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->UNSUPPORTED:Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 91
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;
    .locals 1

    .line 91
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$PseudoClassIdents;

    return-object v0
.end method
