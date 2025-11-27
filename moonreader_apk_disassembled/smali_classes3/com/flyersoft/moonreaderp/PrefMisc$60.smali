.class Lcom/flyersoft/moonreaderp/PrefMisc$60;
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

    .line 1574
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x1

    .line 1576
    invoke-static {p1}, Lcom/flyersoft/tools/A;->initTTSFilters(Z)V

    const/4 p1, 0x0

    .line 1577
    sput-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->replaceLay:Landroid/widget/LinearLayout;

    sput-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->filterLay:Landroid/widget/LinearLayout;

    return-void
.end method
