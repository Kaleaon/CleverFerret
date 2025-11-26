.class Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$1;
.super Ljava/lang/Object;
.source "NamesReplacementPreview.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

.field final synthetic val$tabLayout:Lcom/google/android/material/tabs/TabLayout;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;Lcom/google/android/material/tabs/TabLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 54
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$1;->this$0:Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$1;->val$tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 57
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$1;->val$tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getTabLayoutBackColor()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setBackgroundColor(I)V

    .line 58
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/misc/NamesReplacementPreview$PreviewView$1;->val$tabLayout:Lcom/google/android/material/tabs/TabLayout;

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getToolbarUnSelectedTextColor()I

    move-result v1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefChapters;->getToolbarSelectedTextColor()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/material/tabs/TabLayout;->setTabTextColors(II)V

    return-void
.end method
