.class public Lcom/flyersoft/moonreaderp/PrefShelf$MyReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PrefShelf.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;


# direct methods
.method public constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 856
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$MyReceiver;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 859
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "added shortcut:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method
