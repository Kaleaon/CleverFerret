.class Lcom/flyersoft/moonreaderp/PrefFontPick$5;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 159
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$5;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 162
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefFontPick;->selfPref:Lcom/flyersoft/moonreaderp/PrefFontPick;

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefFontPick$5$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefFontPick$5$1;-><init>(Lcom/flyersoft/moonreaderp/PrefFontPick$5;)V

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->showCssFontOptions(Landroid/app/Dialog;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    return-void
.end method
