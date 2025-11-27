.class Lcom/flyersoft/moonreaderp/PrefMisc$59;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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

    .line 1579
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    const/4 p1, 0x1

    .line 1581
    new-array p1, p1, [Ljava/lang/Object;

    const-string v0, "tts filter cancelled"

    const/4 v1, 0x0

    aput-object v0, p1, v1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 1582
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->saveFilterList()V

    const/4 p1, 0x0

    .line 1583
    invoke-static {p1}, Lcom/flyersoft/tools/A;->saveTTSFilterToFile(Ljava/lang/String;)Z

    return-void
.end method
