.class Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;
.source "CalendarPickerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/BookCalendar/CalendarPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MonthAdapter"
.end annotation


# instance fields
.field private final inflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;


# direct methods
.method private constructor <init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 882
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-direct {p0}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;-><init>()V

    .line 883
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->inflater:Landroid/view/LayoutInflater;

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Lcom/flyersoft/views/BookCalendar/CalendarPickerView-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;-><init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 906
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget-object v0, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .locals 1

    .line 919
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6

    .line 923
    move-object v0, p2

    check-cast v0, Lcom/flyersoft/views/BookCalendar/MonthView;

    .line 924
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdecorators(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/flyersoft/views/BookCalendar/MonthView;->setDecorators(Ljava/util/List;)V

    .line 925
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetmonthsReverseOrder(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 926
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget-object p2, p2, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    sub-int/2addr p2, p1

    add-int/lit8 p1, p2, -0x1

    .line 929
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget-object p2, p2, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;

    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetcells(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->getValueAtIndex(I)Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Ljava/util/List;

    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdisplayOnly(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z

    move-result v3

    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgettitleTypeface(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Landroid/graphics/Typeface;

    move-result-object v4

    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdateTypeface(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/flyersoft/views/BookCalendar/MonthView;->init(Lcom/flyersoft/views/BookCalendar/MonthDescriptor;Ljava/util/List;ZLandroid/graphics/Typeface;Landroid/graphics/Typeface;)V

    return-object v0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    .line 897
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p0, p2, p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 17

    move-object/from16 v0, p0

    .line 888
    iget-object v2, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->inflater:Landroid/view/LayoutInflater;

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetweekdayNameFormat(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Ljava/text/DateFormat;

    move-result-object v3

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget-object v4, v1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->listener:Lcom/flyersoft/views/BookCalendar/MonthView$Listener;

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget-object v5, v1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->today:Ljava/util/Calendar;

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdayBackgroundResId(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)I

    move-result v7

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdayTextColorResId(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)I

    move-result v8

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgettitleTextStyle(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)I

    move-result v9

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdisplayHeader(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z

    move-result v10

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdisplayDayNamesHeaderRow(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z

    move-result v12

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdisplayAlwaysDigitNumbers(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z

    move-result v13

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdecorators(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Ljava/util/List;

    move-result-object v14

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetlocale(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Ljava/util/Locale;

    move-result-object v15

    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->this$0:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-static {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->-$$Nest$fgetdayViewAdapter(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/DayViewAdapter;

    move-result-object v16

    const/4 v6, 0x0

    const/4 v11, 0x0

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v16}, Lcom/flyersoft/views/BookCalendar/MonthView;->create(Landroid/view/ViewGroup;Landroid/view/LayoutInflater;Ljava/text/DateFormat;Lcom/flyersoft/views/BookCalendar/MonthView$Listener;Ljava/util/Calendar;IIIIZIZZLjava/util/List;Ljava/util/Locale;Lcom/flyersoft/views/BookCalendar/DayViewAdapter;)Lcom/flyersoft/views/BookCalendar/MonthView;

    move-result-object v1

    .line 892
    new-instance v2, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;

    invoke-direct {v2, v0, v1}, Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter$Holder;-><init>(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;Landroid/view/View;)V

    return-object v2
.end method
