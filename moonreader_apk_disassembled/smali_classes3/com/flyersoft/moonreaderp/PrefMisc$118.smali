.class Lcom/flyersoft/moonreaderp/PrefMisc$118;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showStdCloudOptions(Landroid/content/Context;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$lay:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3304
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$118;->val$lay:Landroid/view/ViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 3307
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$118;->val$lay:Landroid/view/ViewGroup;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->clearRecords:I

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3308
    invoke-static {}, Lcom/flyersoft/components/cloud/Sync;->clearDownloadUploadRecord()V

    return-void
.end method
