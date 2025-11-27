.class public Lcom/flyersoft/views/BookCalendar/CalendarPickerView;
.super Lcom/flyersoft/views/recyclerview/MyRecyclerView;
.source "CalendarPickerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;,
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;,
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DefaultOnInvalidDateSelectedListener;,
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnInvalidDateSelectedListener;,
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;,
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;,
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;,
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;,
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DateSelectableFilter;,
        Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickInterceptor;
    }
.end annotation


# static fields
.field private static final explicitlyNumericYearLocaleLanguages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final adapter:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;

.field private cellClickInterceptor:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickInterceptor;

.field private final cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private dateConfiguredListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DateSelectableFilter;

.field private dateListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;

.field private dateTypeface:Landroid/graphics/Typeface;

.field private dayBackgroundResId:I

.field private dayTextColorResId:I

.field private dayViewAdapter:Lcom/flyersoft/views/BookCalendar/DayViewAdapter;

.field private decorators:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/CalendarCellDecorator;",
            ">;"
        }
    .end annotation
.end field

.field private displayAlwaysDigitNumbers:Z

.field private displayDayNamesHeaderRow:Z

.field private displayHeader:Z

.field private displayOnly:Z

.field private fullDateFormat:Ljava/text/DateFormat;

.field final highlightedCals:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Calendar;",
            ">;"
        }
    .end annotation
.end field

.field final highlightedCells:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field private invalidDateListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnInvalidDateSelectedListener;

.field final listener:Lcom/flyersoft/views/BookCalendar/MonthView$Listener;

.field private locale:Ljava/util/Locale;

.field private maxCal:Ljava/util/Calendar;

.field private minCal:Ljava/util/Calendar;

.field private final monthBuilder:Ljava/lang/StringBuilder;

.field private monthCounter:Ljava/util/Calendar;

.field private monthFormatter:Ljava/util/Formatter;

.field final months:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/MonthDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field private monthsReverseOrder:Z

.field final selectedCals:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Calendar;",
            ">;"
        }
    .end annotation
.end field

.field final selectedCells:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field selectionMode:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

.field private timeZone:Ljava/util/TimeZone;

.field private titleTextStyle:I

.field private titleTypeface:Landroid/graphics/Typeface;

.field today:Ljava/util/Calendar;

.field private weekdayNameFormat:Ljava/text/DateFormat;


# direct methods
.method static bridge synthetic -$$Nest$fgetcellClickInterceptor(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickInterceptor;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cellClickInterceptor:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickInterceptor;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetcells(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdateListener(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dateListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdateTypeface(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Landroid/graphics/Typeface;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dateTypeface:Landroid/graphics/Typeface;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdayBackgroundResId(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dayBackgroundResId:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetdayTextColorResId(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dayTextColorResId:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetdayViewAdapter(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Lcom/flyersoft/views/BookCalendar/DayViewAdapter;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dayViewAdapter:Lcom/flyersoft/views/BookCalendar/DayViewAdapter;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdecorators(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->decorators:Ljava/util/List;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetdisplayAlwaysDigitNumbers(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayAlwaysDigitNumbers:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetdisplayDayNamesHeaderRow(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayDayNamesHeaderRow:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetdisplayHeader(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayHeader:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetdisplayOnly(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayOnly:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetlocale(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Ljava/util/Locale;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmonthsReverseOrder(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthsReverseOrder:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgettitleTextStyle(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)I
    .locals 0

    iget p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->titleTextStyle:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgettitleTypeface(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Landroid/graphics/Typeface;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->titleTypeface:Landroid/graphics/Typeface;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetweekdayNameFormat(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)Ljava/text/DateFormat;
    .locals 0

    iget-object p0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->weekdayNameFormat:Ljava/text/DateFormat;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputdisplayOnly(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayOnly:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmonthsReverseOrder(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthsReverseOrder:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputweekdayNameFormat(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Ljava/text/DateFormat;)V
    .locals 0

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->weekdayNameFormat:Ljava/text/DateFormat;

    return-void
.end method

.method static bridge synthetic -$$Nest$mdoSelectDate(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Ljava/util/Date;Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->doSelectDate(Ljava/util/Date;Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;)Z

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mscrollToSelectedDates(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->scrollToSelectedDates()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mvalidateAndUpdate(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateAndUpdate()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, "ar"

    const-string v2, "my"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    .line 74
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->explicitlyNumericYearLocaleLanguages:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 129
    invoke-direct {p0, p1, p2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 77
    new-instance v0, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    invoke-direct {v0}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    .line 79
    new-instance v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickedListener;-><init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Lcom/flyersoft/views/BookCalendar/CalendarPickerView-IA;)V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->listener:Lcom/flyersoft/views/BookCalendar/MonthView$Listener;

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCells:Ljava/util/List;

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCals:Ljava/util/List;

    .line 106
    new-instance v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DefaultOnInvalidDateSelectedListener;

    invoke-direct {v0, p0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DefaultOnInvalidDateSelectedListener;-><init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Lcom/flyersoft/views/BookCalendar/CalendarPickerView-IA;)V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->invalidDateListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnInvalidDateSelectedListener;

    .line 110
    new-instance v0, Lcom/flyersoft/views/BookCalendar/DefaultDayViewAdapter;

    invoke-direct {v0}, Lcom/flyersoft/views/BookCalendar/DefaultDayViewAdapter;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dayViewAdapter:Lcom/flyersoft/views/BookCalendar/DayViewAdapter;

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x32

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthBuilder:Ljava/lang/StringBuilder;

    .line 131
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 132
    sget-object v0, Lcom/flyersoft/moonreaderp/R$styleable;->CalendarPickerView:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 133
    sget p2, Lcom/flyersoft/moonreaderp/R$styleable;->CalendarPickerView_tsquare_dayBackground:I

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->calendar_bg_selector:I

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dayBackgroundResId:I

    const/4 p2, 0x0

    .line 138
    iput p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dayTextColorResId:I

    .line 139
    sget v0, Lcom/flyersoft/moonreaderp/R$styleable;->CalendarPickerView_tsquare_titleTextStyle:I

    sget v2, Lcom/flyersoft/moonreaderp/R$style;->CalendarTitle:I

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->titleTextStyle:I

    .line 141
    sget v0, Lcom/flyersoft/moonreaderp/R$styleable;->CalendarPickerView_tsquare_displayHeader:I

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayHeader:Z

    .line 142
    sget v0, Lcom/flyersoft/moonreaderp/R$styleable;->CalendarPickerView_tsquare_displayDayNamesHeaderRow:I

    .line 143
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayDayNamesHeaderRow:Z

    .line 144
    sget v0, Lcom/flyersoft/moonreaderp/R$styleable;->CalendarPickerView_tsquare_displayAlwaysDigitNumbers:I

    .line 145
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayAlwaysDigitNumbers:Z

    .line 146
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 148
    new-instance p1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;

    invoke-direct {p1, p0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;-><init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;Lcom/flyersoft/views/BookCalendar/CalendarPickerView-IA;)V

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->adapter:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;

    .line 151
    invoke-static {}, Lcom/flyersoft/tools/C;->dialogColor()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setBackgroundColor(I)V

    .line 153
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    .line 154
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    .line 155
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    invoke-static {p2, p1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->today:Ljava/util/Calendar;

    .line 156
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {p1, p2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->minCal:Ljava/util/Calendar;

    .line 157
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {p1, p2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->maxCal:Ljava/util/Calendar;

    .line 158
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {p1, p2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    .line 159
    new-instance p1, Ljava/text/SimpleDateFormat;

    const-string p2, "EEE"

    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-direct {p1, p2, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->weekdayNameFormat:Ljava/text/DateFormat;

    .line 160
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {p1, p2}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    const/4 p1, 0x2

    .line 161
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {p1, p2}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->fullDateFormat:Ljava/text/DateFormat;

    .line 162
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {p1, p2}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 164
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->isInEditMode()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 165
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {p1, p2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object p1

    .line 166
    invoke-virtual {p1, v2, v2}, Ljava/util/Calendar;->add(II)V

    .line 168
    new-instance p2, Ljava/util/Date;

    invoke-direct {p2}, Ljava/util/Date;-><init>()V

    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->init(Ljava/util/Date;Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    move-result-object p1

    new-instance p2, Ljava/util/Date;

    invoke-direct {p2}, Ljava/util/Date;-><init>()V

    .line 169
    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->withSelectedDate(Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    :cond_0
    return-void
.end method

.method private applyMultiSelect(Ljava/util/Date;Ljava/util/Calendar;)Ljava/util/Date;
    .locals 3

    .line 790
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    .line 791
    invoke-virtual {v1}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p1, 0x0

    .line 793
    invoke-virtual {v1, p1}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setSelected(Z)V

    .line 794
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    .line 799
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Calendar;

    .line 800
    invoke-static {v1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->sameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 801
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {p2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_3
    return-object p1
.end method

.method private static betweenDates(Ljava/util/Calendar;Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .locals 0

    .line 1027
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p0

    .line 1028
    invoke-static {p0, p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->betweenDates(Ljava/util/Date;Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result p0

    return p0
.end method

.method static betweenDates(Ljava/util/Date;Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .locals 1

    .line 1032
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    .line 1033
    invoke-virtual {p0, p1}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1034
    :cond_0
    invoke-virtual {p2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private clearOldSelections()V
    .locals 5

    .line 768
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    const/4 v2, 0x0

    .line 770
    invoke-virtual {v1, v2}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setSelected(Z)V

    .line 772
    iget-object v2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dateListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;

    if-eqz v2, :cond_0

    .line 773
    invoke-virtual {v1}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object v2

    .line 775
    iget-object v3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectionMode:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    sget-object v4, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->RANGE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    if-ne v3, v4, :cond_2

    .line 776
    iget-object v3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-eqz v1, :cond_1

    .line 777
    iget-object v3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v1, v3, :cond_0

    .line 778
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dateListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;

    invoke-interface {v1, v2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;->onDateUnselected(Ljava/util/Date;)V

    goto :goto_0

    .line 781
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dateListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;

    invoke-interface {v1, v2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;->onDateUnselected(Ljava/util/Date;)V

    goto :goto_0

    .line 785
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 786
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method private static containsDate(Ljava/util/List;Ljava/util/Calendar;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Calendar;",
            ">;",
            "Ljava/util/Calendar;",
            ")Z"
        }
    .end annotation

    .line 996
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    .line 997
    invoke-static {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->sameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private containsDate(Ljava/util/List;Ljava/util/Date;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Calendar;",
            ">;",
            "Ljava/util/Date;",
            ")Z"
        }
    .end annotation

    .line 990
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    .line 991
    invoke-virtual {v0, p2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 992
    invoke-static {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->containsDate(Ljava/util/List;Ljava/util/Calendar;)Z

    move-result p1

    return p1
.end method

.method private static dbg(Ljava/util/Date;Ljava/util/Date;)Ljava/lang/String;
    .locals 2

    .line 555
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "minDate: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "\nmaxDate: "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private doSelectDate(Ljava/util/Date;Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;)Z
    .locals 9

    .line 688
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    .line 689
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 691
    invoke-static {v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setMidnight(Ljava/util/Calendar;)V

    .line 694
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    .line 695
    sget-object v3, Lcom/flyersoft/views/BookCalendar/RangeState;->NONE:Lcom/flyersoft/views/BookCalendar/RangeState;

    invoke-virtual {v2, v3}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setRangeState(Lcom/flyersoft/views/BookCalendar/RangeState;)V

    goto :goto_0

    .line 698
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectionMode:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    invoke-virtual {v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->ordinal()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_4

    if-eq v1, v3, :cond_3

    const/4 v4, 0x2

    if-ne v1, v4, :cond_2

    .line 700
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v3, :cond_1

    .line 702
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->clearOldSelections()V

    goto :goto_1

    .line 703
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v3, :cond_5

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 705
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->clearOldSelections()V

    goto :goto_1

    .line 717
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Unknown selectionMode "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectionMode:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 710
    :cond_3
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->applyMultiSelect(Ljava/util/Date;Ljava/util/Calendar;)Ljava/util/Date;

    move-result-object p1

    goto :goto_1

    .line 714
    :cond_4
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->clearOldSelections()V

    :cond_5
    :goto_1
    if-eqz p1, :cond_b

    .line 722
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 723
    :cond_6
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 724
    invoke-virtual {p2, v3}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setSelected(Z)V

    .line 726
    :cond_7
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 728
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectionMode:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    sget-object v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->RANGE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    if-ne p2, v0, :cond_b

    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-le p2, v3, :cond_b

    .line 730
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    invoke-virtual {p2}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object p2

    .line 731
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    invoke-virtual {v0}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 732
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    sget-object v4, Lcom/flyersoft/views/BookCalendar/RangeState;->FIRST:Lcom/flyersoft/views/BookCalendar/RangeState;

    invoke-virtual {v1, v4}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setRangeState(Lcom/flyersoft/views/BookCalendar/RangeState;)V

    .line 733
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    sget-object v4, Lcom/flyersoft/views/BookCalendar/RangeState;->LAST:Lcom/flyersoft/views/BookCalendar/RangeState;

    invoke-virtual {v1, v4}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setRangeState(Lcom/flyersoft/views/BookCalendar/RangeState;)V

    .line 735
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    iget-object v4, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Calendar;

    invoke-direct {p0, v4}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthKey(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->getIndexOfKey(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 736
    iget-object v4, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    iget-object v5, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Calendar;

    invoke-direct {p0, v5}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthKey(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->getIndexOfKey(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    :goto_2
    if-gt v1, v4, :cond_b

    .line 738
    iget-object v5, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    invoke-virtual {v5, v1}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->getValueAtIndex(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 739
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 740
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_9
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    .line 741
    invoke-virtual {v7}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 742
    invoke-virtual {v7}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 743
    invoke-virtual {v7}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelectable()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 744
    invoke-virtual {v7, v3}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setSelected(Z)V

    .line 745
    sget-object v8, Lcom/flyersoft/views/BookCalendar/RangeState;->MIDDLE:Lcom/flyersoft/views/BookCalendar/RangeState;

    invoke-virtual {v7, v8}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setRangeState(Lcom/flyersoft/views/BookCalendar/RangeState;)V

    .line 746
    iget-object v8, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 755
    :cond_b
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateAndUpdate()V

    if-eqz p1, :cond_c

    return v3

    :cond_c
    return v2
.end method

.method private formatMonthDate(Ljava/util/Date;)Ljava/lang/String;
    .locals 9

    .line 641
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 650
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {v1}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 653
    iget-boolean v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayAlwaysDigitNumbers:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->explicitlyNumericYearLocaleLanguages:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    .line 654
    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 655
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 656
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "MMMM"

    iget-object v4, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 657
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyy"

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 658
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 659
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 662
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthFormatter:Ljava/util/Formatter;

    .line 663
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {p1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v8

    const/16 v7, 0x34

    .line 662
    invoke-static/range {v1 .. v8}, Landroid/text/format/DateUtils;->formatDateRange(Landroid/content/Context;Ljava/util/Formatter;JJILjava/lang/String;)Ljava/util/Formatter;

    move-result-object p1

    .line 663
    invoke-virtual {p1}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object p1

    .line 667
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthBuilder:Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 670
    invoke-static {v0}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    return-object p1
.end method

.method private getMonthCellWithIndexByDate(Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;
    .locals 7

    .line 859
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    .line 860
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 861
    invoke-direct {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthKey(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object p1

    .line 862
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object v2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {v1, v2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v1

    .line 864
    iget-object v2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    invoke-virtual {v2, p1}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->getIndexOfKey(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    return-object v3

    .line 867
    :cond_0
    iget-object v4, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    invoke-virtual {v4, p1}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 868
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 869
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    .line 870
    invoke-virtual {v5}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 871
    invoke-static {v1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->sameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v5}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelectable()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 872
    new-instance p1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p1, v5, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;-><init>(Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;I)V

    return-object p1

    :cond_3
    return-object v3
.end method

.method private isDateSelectable(Ljava/util/Date;)Z
    .locals 1

    .line 1043
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dateConfiguredListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DateSelectableFilter;

    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DateSelectableFilter;->isDateSelectable(Ljava/util/Date;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method private static maxDate(Ljava/util/List;)Ljava/util/Calendar;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Calendar;",
            ">;)",
            "Ljava/util/Calendar;"
        }
    .end annotation

    if-eqz p0, :cond_1

    .line 1013
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1016
    :cond_0
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1017
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Calendar;

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static minDate(Ljava/util/List;)Ljava/util/Calendar;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Calendar;",
            ">;)",
            "Ljava/util/Calendar;"
        }
    .end annotation

    if-eqz p0, :cond_1

    .line 1005
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1008
    :cond_0
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    const/4 v0, 0x0

    .line 1009
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Calendar;

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private monthKey(Lcom/flyersoft/views/BookCalendar/MonthDescriptor;)Ljava/lang/String;
    .locals 2

    .line 764
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getYear()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getMonth()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private monthKey(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2

    .line 760
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static sameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .locals 3

    const/4 v0, 0x2

    .line 1021
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    .line 1022
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x5

    .line 1023
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result p0

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static sameMonth(Ljava/util/Calendar;Lcom/flyersoft/views/BookCalendar/MonthDescriptor;)Z
    .locals 2

    const/4 v0, 0x2

    .line 1039
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getMonth()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result p0

    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getYear()I

    move-result p1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private scrollToSelectedDates()V
    .locals 7

    .line 435
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v2, v1

    const/4 v3, 0x0

    .line 436
    :goto_0
    iget-object v4, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 437
    iget-object v4, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;

    if-nez v1, :cond_2

    .line 439
    iget-object v5, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Calendar;

    .line 440
    invoke-static {v6, v4}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->sameMonth(Ljava/util/Calendar;Lcom/flyersoft/views/BookCalendar/MonthDescriptor;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 441
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_1
    if-nez v1, :cond_2

    if-nez v2, :cond_2

    .line 445
    invoke-static {v0, v4}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->sameMonth(Ljava/util/Calendar;Lcom/flyersoft/views/BookCalendar/MonthDescriptor;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 446
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    if-eqz v1, :cond_4

    .line 451
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->scrollToSelectedMonth(I)V

    return-void

    :cond_4
    if-eqz v2, :cond_5

    .line 453
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->scrollToSelectedMonth(I)V

    :cond_5
    return-void
.end method

.method private scrollToSelectedMonth(I)V
    .locals 1

    const/4 v0, 0x0

    .line 415
    invoke-direct {p0, p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->scrollToSelectedMonth(IZ)V

    return-void
.end method

.method private scrollToSelectedMonth(IZ)V
    .locals 1

    .line 419
    new-instance v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$1;-><init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;IZ)V

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static setMidnight(Ljava/util/Calendar;)V
    .locals 2

    const/16 v0, 0xb

    const/4 v1, 0x0

    .line 560
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v0, 0xc

    .line 561
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v0, 0xd

    .line 562
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v0, 0xe

    .line 563
    invoke-virtual {p0, v0, v1}, Ljava/util/Calendar;->set(II)V

    return-void
.end method

.method private validateAndUpdate()V
    .locals 4

    .line 407
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 408
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v3, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 409
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->adapter:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setAdapter(Lcom/flyersoft/views/recyclerview/MyRecyclerView$MyAdapter;)V

    .line 411
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->adapter:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;

    invoke-virtual {v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method private validateDate(Ljava/util/Date;)V
    .locals 1

    if-eqz p1, :cond_0

    return-void

    .line 677
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Selected date must be non-null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public clearHighlightedDates()V
    .locals 3

    .line 837
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    const/4 v2, 0x0

    .line 838
    invoke-virtual {v1, v2}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setHighlighted(Z)V

    goto :goto_0

    .line 840
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 841
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCals:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 843
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateAndUpdate()V

    return-void
.end method

.method public clearSelectedDates()V
    .locals 3

    .line 828
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    .line 829
    sget-object v2, Lcom/flyersoft/views/BookCalendar/RangeState;->NONE:Lcom/flyersoft/views/BookCalendar/RangeState;

    invoke-virtual {v1, v2}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setRangeState(Lcom/flyersoft/views/BookCalendar/RangeState;)V

    goto :goto_0

    .line 832
    :cond_0
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->clearOldSelections()V

    .line 833
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateAndUpdate()V

    return-void
.end method

.method public fixDialogDimens()V
    .locals 4

    .line 483
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getMeasuredHeight()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getMeasuredWidth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const-string v0, "Fixing dimensions to h = %d / w = %d"

    invoke-static {v0, v2}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 485
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getMeasuredHeight()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 486
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getMeasuredWidth()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 488
    new-instance v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$2;

    invoke-direct {v0, p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$2;-><init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V

    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public getDecorators()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/CalendarCellDecorator;",
            ">;"
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->decorators:Ljava/util/List;

    return-object v0
.end method

.method getMonthCells(Lcom/flyersoft/views/BookCalendar/MonthDescriptor;Ljava/util/Calendar;)Ljava/util/List;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/views/BookCalendar/MonthDescriptor;",
            "Ljava/util/Calendar;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;",
            ">;>;"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 937
    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object v2, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {v1, v2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v1

    .line 938
    invoke-virtual/range {p2 .. p2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 939
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x5

    const/4 v4, 0x1

    .line 940
    invoke-virtual {v1, v3, v4}, Ljava/util/Calendar;->set(II)V

    const/4 v5, 0x7

    .line 941
    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v6

    .line 942
    invoke-virtual {v1}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    move-result v7

    sub-int/2addr v7, v6

    if-lez v7, :cond_0

    add-int/lit8 v7, v7, -0x7

    .line 946
    :cond_0
    invoke-virtual {v1, v3, v7}, Ljava/util/Calendar;->add(II)V

    .line 948
    iget-object v6, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-static {v6}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->minDate(Ljava/util/List;)Ljava/util/Calendar;

    move-result-object v6

    .line 949
    iget-object v7, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-static {v7}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->maxDate(Ljava/util/List;)Ljava/util/Calendar;

    move-result-object v7

    :cond_1
    const/4 v8, 0x2

    .line 951
    invoke-virtual {v1, v8}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getMonth()I

    move-result v10

    add-int/2addr v10, v4

    if-lt v9, v10, :cond_2

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getYear()I

    move-result v10

    if-ge v9, v10, :cond_9

    .line 952
    :cond_2
    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getYear()I

    move-result v10

    if-gt v9, v10, :cond_9

    .line 953
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v9

    new-array v10, v4, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v9, v10, v11

    const-string v9, "Building week row starting at %s"

    invoke-static {v9, v10}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 954
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 955
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v10, 0x0

    :goto_0
    if-ge v10, v5, :cond_1

    .line 957
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v13

    .line 959
    invoke-virtual {v1, v8}, Ljava/util/Calendar;->get(I)I

    move-result v12

    invoke-virtual/range {p1 .. p1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getMonth()I

    move-result v14

    if-ne v12, v14, :cond_3

    const/4 v14, 0x1

    goto :goto_1

    :cond_3
    const/4 v14, 0x0

    :goto_1
    if-eqz v14, :cond_4

    .line 960
    iget-object v12, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-static {v12, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->containsDate(Ljava/util/List;Ljava/util/Calendar;)Z

    move-result v12

    if-eqz v12, :cond_4

    const/16 v16, 0x1

    goto :goto_2

    :cond_4
    const/16 v16, 0x0

    :goto_2
    if-eqz v14, :cond_5

    .line 964
    invoke-direct {v0, v13}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->isDateSelectable(Ljava/util/Date;)Z

    move-result v12

    if-eqz v12, :cond_5

    const/4 v15, 0x1

    goto :goto_3

    :cond_5
    const/4 v15, 0x0

    .line 965
    :goto_3
    iget-object v12, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->today:Ljava/util/Calendar;

    invoke-static {v1, v12}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->sameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v17

    .line 966
    iget-object v12, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCals:Ljava/util/List;

    invoke-static {v12, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->containsDate(Ljava/util/List;Ljava/util/Calendar;)Z

    move-result v18

    .line 967
    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v19

    .line 969
    sget-object v12, Lcom/flyersoft/views/BookCalendar/RangeState;->NONE:Lcom/flyersoft/views/BookCalendar/RangeState;

    .line 970
    iget-object v5, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-le v5, v4, :cond_8

    .line 971
    invoke-static {v6, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->sameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 972
    sget-object v12, Lcom/flyersoft/views/BookCalendar/RangeState;->FIRST:Lcom/flyersoft/views/BookCalendar/RangeState;

    goto :goto_4

    .line 973
    :cond_6
    iget-object v5, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-static {v5}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->maxDate(Ljava/util/List;)Ljava/util/Calendar;

    move-result-object v5

    invoke-static {v5, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->sameDate(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 974
    sget-object v12, Lcom/flyersoft/views/BookCalendar/RangeState;->LAST:Lcom/flyersoft/views/BookCalendar/RangeState;

    goto :goto_4

    .line 975
    :cond_7
    invoke-static {v1, v6, v7}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->betweenDates(Ljava/util/Calendar;Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 976
    sget-object v12, Lcom/flyersoft/views/BookCalendar/RangeState;->MIDDLE:Lcom/flyersoft/views/BookCalendar/RangeState;

    :cond_8
    :goto_4
    move-object/from16 v20, v12

    .line 980
    new-instance v12, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    invoke-direct/range {v12 .. v20}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;-><init>(Ljava/util/Date;ZZZZZILcom/flyersoft/views/BookCalendar/RangeState;)V

    invoke-interface {v9, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 983
    invoke-virtual {v1, v3, v4}, Ljava/util/Calendar;->add(II)V

    add-int/lit8 v10, v10, 0x1

    const/4 v5, 0x7

    goto :goto_0

    :cond_9
    return-object v2
.end method

.method public getSelectedDate()Ljava/util/Date;
    .locals 2

    .line 541
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSelectedDates()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation

    .line 545
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 546
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    .line 547
    invoke-virtual {v2}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 549
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    return-object v0
.end method

.method public highlightDates(Ljava/util/Collection;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/util/Date;",
            ">;)V"
        }
    .end annotation

    .line 809
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    .line 810
    invoke-direct {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateDate(Ljava/util/Date;)V

    .line 812
    invoke-direct {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getMonthCellWithIndexByDate(Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 814
    iget-object v2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object v3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {v2, v3}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v2

    .line 815
    invoke-virtual {v2, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 816
    iget-object v0, v1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;->cell:Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    .line 818
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCells:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 819
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCals:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    .line 820
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->setHighlighted(Z)V

    goto :goto_0

    .line 824
    :cond_1
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateAndUpdate()V

    return-void
.end method

.method public init(Ljava/util/Date;Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 2

    .line 285
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->init(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;Ljava/util/Locale;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    move-result-object p1

    return-object p1
.end method

.method public init(Ljava/util/Date;Ljava/util/Date;Ljava/util/Locale;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 1

    .line 336
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->init(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;Ljava/util/Locale;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    move-result-object p1

    return-object p1
.end method

.method public init(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 1

    .line 308
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->init(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;Ljava/util/Locale;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    move-result-object p1

    return-object p1
.end method

.method public init(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;Ljava/util/Locale;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;
    .locals 6

    if-eqz p1, :cond_6

    if-eqz p2, :cond_6

    .line 195
    invoke-virtual {p1, p2}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_5

    if-eqz p4, :cond_4

    if-eqz p3, :cond_3

    .line 207
    iput-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    .line 208
    iput-object p4, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    .line 209
    invoke-static {p3, p4}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->today:Ljava/util/Calendar;

    .line 210
    invoke-static {p3, p4}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->minCal:Ljava/util/Calendar;

    .line 211
    invoke-static {p3, p4}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->maxCal:Ljava/util/Calendar;

    .line 212
    invoke-static {p3, p4}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    .line 213
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;

    .line 214
    invoke-virtual {v1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getDate()Ljava/util/Date;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->formatMonthDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->setLabel(Ljava/lang/String;)V

    goto :goto_0

    .line 216
    :cond_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "EEE"

    invoke-direct {v0, v1, p4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->weekdayNameFormat:Ljava/text/DateFormat;

    .line 217
    invoke-virtual {v0, p3}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    const/4 v0, 0x2

    .line 218
    invoke-static {v0, p4}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v1

    iput-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->fullDateFormat:Ljava/text/DateFormat;

    .line 219
    invoke-virtual {v1, p3}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 220
    new-instance p3, Ljava/util/Formatter;

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthBuilder:Ljava/lang/StringBuilder;

    invoke-direct {p3, v1, p4}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    iput-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthFormatter:Ljava/util/Formatter;

    .line 222
    sget-object p3, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->SINGLE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    iput-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectionMode:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    .line 224
    iget-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCals:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->clear()V

    .line 225
    iget-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectedCells:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->clear()V

    .line 226
    iget-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCals:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->clear()V

    .line 227
    iget-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->highlightedCells:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->clear()V

    .line 230
    iget-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    invoke-virtual {p3}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->clear()V

    .line 231
    iget-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->clear()V

    .line 232
    iget-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->minCal:Ljava/util/Calendar;

    invoke-virtual {p3, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 233
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->maxCal:Ljava/util/Calendar;

    invoke-virtual {p1, p2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 234
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->minCal:Ljava/util/Calendar;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setMidnight(Ljava/util/Calendar;)V

    .line 235
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->maxCal:Ljava/util/Calendar;

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setMidnight(Ljava/util/Calendar;)V

    const/4 p1, 0x0

    .line 236
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->displayOnly:Z

    .line 240
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->maxCal:Ljava/util/Calendar;

    const/16 p3, 0xc

    const/4 p4, -0x1

    invoke-virtual {p2, p3, p4}, Ljava/util/Calendar;->add(II)V

    .line 243
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    iget-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->minCal:Ljava/util/Calendar;

    invoke-virtual {p3}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 244
    iget-object p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->maxCal:Ljava/util/Calendar;

    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    move-result p2

    .line 245
    iget-object p3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->maxCal:Ljava/util/Calendar;

    const/4 p4, 0x1

    invoke-virtual {p3, p4}, Ljava/util/Calendar;->get(I)I

    move-result p3

    .line 246
    :goto_1
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    invoke-virtual {v1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-le v1, p2, :cond_1

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    .line 247
    invoke-virtual {v1, p4}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ge v1, p3, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    .line 248
    invoke-virtual {v1, p4}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/lit8 v2, p3, 0x1

    if-ge v1, v2, :cond_2

    .line 249
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 250
    new-instance v2, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;

    iget-object v3, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    .line 251
    invoke-virtual {v3, v0}, Ljava/util/Calendar;->get(I)I

    move-result v3

    iget-object v4, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    invoke-virtual {v4, p4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 252
    invoke-direct {p0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->formatMonthDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v4, v1, v5}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;-><init>(IILjava/util/Date;Ljava/lang/String;)V

    .line 253
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cells:Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;

    invoke-direct {p0, v2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthKey(Lcom/flyersoft/views/BookCalendar/MonthDescriptor;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    invoke-virtual {p0, v2, v4}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getMonthCells(Lcom/flyersoft/views/BookCalendar/MonthDescriptor;Ljava/util/Calendar;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lcom/flyersoft/views/BookCalendar/IndexedLinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    new-array v1, p4, [Ljava/lang/Object;

    aput-object v2, v1, p1

    const-string v3, "Adding month %s"

    invoke-static {v3, v1}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 255
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->monthCounter:Ljava/util/Calendar;

    invoke-virtual {v1, v0, p4}, Ljava/util/Calendar;->add(II)V

    goto :goto_1

    .line 259
    :cond_2
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateAndUpdate()V

    .line 260
    new-instance p1, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    invoke-direct {p1, p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;-><init>(Lcom/flyersoft/views/BookCalendar/CalendarPickerView;)V

    return-object p1

    .line 203
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Time zone is null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 200
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Locale is null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 196
    :cond_5
    new-instance p3, Ljava/lang/IllegalArgumentException;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "minDate must be before maxDate.  "

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    invoke-static {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dbg(Ljava/util/Date;Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p3

    .line 192
    :cond_6
    new-instance p3, Ljava/lang/IllegalArgumentException;

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "minDate and maxDate must be non-null.  "

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 193
    invoke-static {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dbg(Ljava/util/Date;Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p3
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 533
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 537
    invoke-super {p0, p1, p2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->onMeasure(II)V

    return-void

    .line 534
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Must have at least one month to display.  Did you forget to call init()?"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public scrollToDate(Ljava/util/Date;)Z
    .locals 3

    .line 460
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->timeZone:Ljava/util/TimeZone;

    iget-object v1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->locale:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    .line 461
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/4 p1, 0x0

    const/4 v1, 0x0

    .line 462
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 463
    iget-object v2, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->months:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;

    .line 464
    invoke-static {v0, v2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->sameMonth(Ljava/util/Calendar;Lcom/flyersoft/views/BookCalendar/MonthDescriptor;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 465
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_2

    .line 470
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->scrollToSelectedMonth(I)V

    const/4 p1, 0x1

    :cond_2
    return p1
.end method

.method public selectDate(Ljava/util/Date;)Z
    .locals 1

    const/4 v0, 0x0

    .line 603
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->selectDate(Ljava/util/Date;Z)Z

    move-result p1

    return p1
.end method

.method public selectDate(Ljava/util/Date;Z)Z
    .locals 2

    .line 618
    invoke-direct {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateDate(Ljava/util/Date;)V

    .line 620
    invoke-direct {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getMonthCellWithIndexByDate(Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 621
    invoke-direct {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->isDateSelectable(Ljava/util/Date;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 624
    :cond_0
    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;->cell:Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    invoke-direct {p0, p1, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->doSelectDate(Ljava/util/Date;Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 626
    iget v0, v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthCellWithMonthIndex;->monthIndex:I

    invoke-direct {p0, v0, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->scrollToSelectedMonth(IZ)V

    :cond_1
    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCellClickInterceptor(Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickInterceptor;)V
    .locals 0

    .line 1085
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->cellClickInterceptor:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$CellClickInterceptor;

    return-void
.end method

.method public setCustomDayView(Lcom/flyersoft/views/BookCalendar/DayViewAdapter;)V
    .locals 0

    .line 1077
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dayViewAdapter:Lcom/flyersoft/views/BookCalendar/DayViewAdapter;

    .line 1078
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->adapter:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;

    if-eqz p1, :cond_0

    .line 1079
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public setDateSelectableFilter(Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DateSelectableFilter;)V
    .locals 0

    .line 1067
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dateConfiguredListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$DateSelectableFilter;

    return-void
.end method

.method public setDateTypeface(Landroid/graphics/Typeface;)V
    .locals 0

    .line 508
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dateTypeface:Landroid/graphics/Typeface;

    .line 509
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateAndUpdate()V

    return-void
.end method

.method public setDecorators(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/CalendarCellDecorator;",
            ">;)V"
        }
    .end annotation

    .line 118
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->decorators:Ljava/util/List;

    .line 119
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->adapter:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;

    if-eqz p1, :cond_0

    .line 120
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$MonthAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public setOnDateSelectedListener(Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;)V
    .locals 0

    .line 1047
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->dateListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;

    return-void
.end method

.method public setOnInvalidDateSelectedListener(Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnInvalidDateSelectedListener;)V
    .locals 0

    .line 1056
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->invalidDateListener:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnInvalidDateSelectedListener;

    return-void
.end method

.method public setTitleTypeface(Landroid/graphics/Typeface;)V
    .locals 0

    .line 500
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->titleTypeface:Landroid/graphics/Typeface;

    .line 501
    invoke-direct {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->validateAndUpdate()V

    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 0

    .line 516
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setTitleTypeface(Landroid/graphics/Typeface;)V

    .line 517
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setDateTypeface(Landroid/graphics/Typeface;)V

    return-void
.end method

.method public unfixDialogDimens()V
    .locals 2

    .line 525
    const-string v0, "Reset the fixed dimensions to allow for re-measurement"

    invoke-static {v0}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;)V

    .line 527
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, -0x1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 528
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 529
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->requestLayout()V

    return-void
.end method
