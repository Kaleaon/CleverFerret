.class Lcom/flyersoft/moonreaderp/PrefMisc$61;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->setTTSFilter(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1568
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1570
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->saveFilterList()V

    const/4 p1, 0x0

    .line 1571
    invoke-static {p1}, Lcom/flyersoft/tools/A;->saveTTSFilterToFile(Ljava/lang/String;)Z

    .line 1572
    sput-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    sput-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    return-void
.end method
