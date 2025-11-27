.class Lcom/flyersoft/moonreaderp/PrefShelfFilter$5;
.super Ljava/lang/Object;
.source "PrefShelfFilter.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefShelfFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 209
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$5;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 212
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$5;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->unReadCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->filterUnread:Z

    .line 213
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$5;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->readingCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->filterReading:Z

    .line 214
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$5;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->finishedCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->filterFinished:Z

    .line 215
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 216
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    :cond_0
    return-void
.end method
