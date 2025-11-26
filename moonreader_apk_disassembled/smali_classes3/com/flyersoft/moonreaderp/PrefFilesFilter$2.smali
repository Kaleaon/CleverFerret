.class Lcom/flyersoft/moonreaderp/PrefFilesFilter$2;
.super Ljava/lang/Object;
.source "PrefFilesFilter.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefFilesFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFilesFilter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFilesFilter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter$2;->this$0:Lcom/flyersoft/moonreaderp/PrefFilesFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 125
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    .line 126
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->files_sort_by:I

    .line 127
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFilesFilter$2;->this$0:Lcom/flyersoft/moonreaderp/PrefFilesFilter;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefFilesFilter;->-$$Nest$msetSortChecked(Lcom/flyersoft/moonreaderp/PrefFilesFilter;)V

    .line 128
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 129
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->doFilesSortModeChanged()V

    :cond_0
    return-void
.end method
