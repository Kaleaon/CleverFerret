.class Lcom/flyersoft/moonreaderp/PrefMisc$117$2;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/components/cloud/Cloud$AfterLogin;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$117;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$117;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$117;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 3199
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$117$2;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$117;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterLogin(ZLjava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_1

    const/4 p1, 0x6

    .line 3203
    sput p1, Lcom/flyersoft/tools/A;->syncType:I

    .line 3204
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 3205
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_0

    sget-boolean p1, Lcom/flyersoft/tools/A;->syncProgress:Z

    if-eqz p1, :cond_0

    .line 3206
    sget-boolean p1, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-static {p2, p1}, Lcom/flyersoft/components/cloud/Sync;->downloadCloudPositionFile(ZZ)V

    :cond_0
    return-void

    :cond_1
    const/4 p1, 0x0

    .line 3208
    sput p1, Lcom/flyersoft/tools/A;->syncType:I

    .line 3209
    sget-object p2, Lcom/flyersoft/moonreaderp/PrefMisc;->syncWebDavCheck:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p2, p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    return-void
.end method
