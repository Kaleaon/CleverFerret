.class Lcom/flyersoft/moonreaderp/PrefMisc$41;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->setPageSound()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1189
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$41;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x0

    .line 1191
    invoke-static {p1, p1}, Lcom/flyersoft/tools/A;->playSound(Landroid/content/Context;Ljava/lang/String;)V

    .line 1192
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$41;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p1, p2, Lcom/flyersoft/moonreaderp/PrefMisc;->pageSoundDlg:Lcom/flyersoft/components/MyDialog;

    return-void
.end method
