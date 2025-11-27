.class Lcom/flyersoft/components/cloud/Sync$25;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync;->openShelfBookFromCloud(Lcom/flyersoft/tools/BookDb$BookInfo;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cloudType:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1208
    iput p1, p0, Lcom/flyersoft/components/cloud/Sync$25;->val$cloudType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1211
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->sync_via_cloud:I

    invoke-static {p2}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object p2

    iget v0, p0, Lcom/flyersoft/components/cloud/Sync$25;->val$cloudType:I

    invoke-static {p2, v0}, Lcom/flyersoft/components/cloud/Cloud;->fixCloudTitle(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->showOptionsWindow(Ljava/lang/String;)V

    return-void
.end method
