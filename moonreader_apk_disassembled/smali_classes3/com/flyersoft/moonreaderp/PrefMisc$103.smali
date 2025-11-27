.class Lcom/flyersoft/moonreaderp/PrefMisc$103;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->doBackup(Landroid/app/Dialog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dlg:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2793
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$103;->val$dlg:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 1

    .line 2796
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$103;->val$dlg:Landroid/app/Dialog;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smbackupProc(Landroid/app/Dialog;I)V

    return-void
.end method
