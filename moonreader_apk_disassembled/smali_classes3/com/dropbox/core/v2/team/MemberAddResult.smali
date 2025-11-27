.class public final Lcom/dropbox/core/v2/team/MemberAddResult;
.super Ljava/lang/Object;
.source "MemberAddResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MemberAddResult$Serializer;,
        Lcom/dropbox/core/v2/team/MemberAddResult$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

.field private duplicateExternalMemberIdValue:Ljava/lang/String;

.field private duplicateMemberPersistentIdValue:Ljava/lang/String;

.field private freeTeamMemberLimitReachedValue:Ljava/lang/String;

.field private persistentIdDisabledValue:Ljava/lang/String;

.field private successValue:Lcom/dropbox/core/v2/team/TeamMemberInfo;

.field private teamLicenseLimitValue:Ljava/lang/String;

.field private userAlreadyOnTeamValue:Ljava/lang/String;

.field private userAlreadyPairedValue:Ljava/lang/String;

.field private userCreationFailedValue:Ljava/lang/String;

.field private userMigrationFailedValue:Ljava/lang/String;

.field private userOnAnotherTeamValue:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->teamLicenseLimitValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/dropbox/core/v2/team/MemberAddResult;)Lcom/dropbox/core/v2/team/TeamMemberInfo;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfo;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyOnTeamValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userOnAnotherTeamValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyPairedValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userMigrationFailedValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateExternalMemberIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$700(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$800(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->persistentIdDisabledValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$900(Lcom/dropbox/core/v2/team/MemberAddResult;)Ljava/lang/String;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userCreationFailedValue:Ljava/lang/String;

    return-object p0
.end method

.method public static duplicateExternalMemberId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 783
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 786
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 789
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->DUPLICATE_EXTERNAL_MEMBER_ID:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndDuplicateExternalMemberId(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 787
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 784
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 781
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static duplicateMemberPersistentId(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 844
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 847
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 850
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->DUPLICATE_MEMBER_PERSISTENT_ID:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndDuplicateMemberPersistentId(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 848
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 845
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 842
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static freeTeamMemberLimitReached(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 481
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 484
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 487
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->FREE_TEAM_MEMBER_LIMIT_REACHED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndFreeTeamMemberLimitReached(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 485
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 482
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 479
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static persistentIdDisabled(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 905
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 908
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 911
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->PERSISTENT_ID_DISABLED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndPersistentIdDisabled(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 909
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 906
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 903
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Lcom/dropbox/core/v2/team/TeamMemberInfo;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 1021
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndSuccess(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Lcom/dropbox/core/v2/team/TeamMemberInfo;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 1019
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static teamLicenseLimit(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 422
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 425
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 428
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->TEAM_LICENSE_LIMIT:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndTeamLicenseLimit(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 426
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 423
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 420
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userAlreadyOnTeam(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 542
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 545
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 548
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_ALREADY_ON_TEAM:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndUserAlreadyOnTeam(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 546
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 543
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 540
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userAlreadyPaired(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 665
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 668
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 671
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_ALREADY_PAIRED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndUserAlreadyPaired(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 669
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 666
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 663
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userCreationFailed(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 965
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 968
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 971
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_CREATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndUserCreationFailed(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 969
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 966
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 963
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userMigrationFailed(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 723
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 726
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 729
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_MIGRATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndUserMigrationFailed(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 727
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 724
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 721
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static userOnAnotherTeam(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 2

    if-eqz p0, :cond_2

    .line 605
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 608
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 611
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_ON_ANOTHER_TEAM:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MemberAddResult;->withTagAndUserOnAnotherTeam(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;

    move-result-object p0

    return-object p0

    .line 609
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String does not match pattern"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 606
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "String is longer than 255"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 603
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 120
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 121
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    return-object v0
.end method

.method private withTagAndDuplicateExternalMemberId(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 280
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 281
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 282
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateExternalMemberIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndDuplicateMemberPersistentId(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 303
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 304
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 305
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndFreeTeamMemberLimitReached(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 165
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 166
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 167
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndPersistentIdDisabled(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 327
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 328
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 329
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->persistentIdDisabledValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Lcom/dropbox/core/v2/team/TeamMemberInfo;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 369
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 370
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 371
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfo;

    return-object v0
.end method

.method private withTagAndTeamLicenseLimit(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 142
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 143
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 144
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->teamLicenseLimitValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserAlreadyOnTeam(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 189
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 190
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 191
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyOnTeamValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserAlreadyPaired(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 235
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 236
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 237
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyPairedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserCreationFailed(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 349
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 350
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 351
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->userCreationFailedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserMigrationFailed(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 257
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 258
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 259
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->userMigrationFailedValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndUserOnAnotherTeam(Lcom/dropbox/core/v2/team/MemberAddResult$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MemberAddResult;
    .locals 1

    .line 213
    new-instance v0, Lcom/dropbox/core/v2/team/MemberAddResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MemberAddResult;-><init>()V

    .line 214
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    .line 215
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MemberAddResult;->userOnAnotherTeamValue:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 1069
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/MemberAddResult;

    if-eqz v2, :cond_19

    .line 1070
    check-cast p1, Lcom/dropbox/core/v2/team/MemberAddResult;

    .line 1071
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 1074
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/MemberAddResult$1;->$SwitchMap$com$dropbox$core$v2$team$MemberAddResult$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    return v1

    .line 1096
    :pswitch_0
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfo;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfo;

    if-eq v2, p1, :cond_4

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamMemberInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    return v1

    :cond_4
    :goto_0
    return v0

    .line 1094
    :pswitch_1
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userCreationFailedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->userCreationFailedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    return v1

    :cond_6
    :goto_1
    return v0

    .line 1092
    :pswitch_2
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->persistentIdDisabledValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->persistentIdDisabledValue:Ljava/lang/String;

    if-eq v2, p1, :cond_8

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_2

    :cond_7
    return v1

    :cond_8
    :goto_2
    return v0

    .line 1090
    :pswitch_3
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_a

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_3

    :cond_9
    return v1

    :cond_a
    :goto_3
    return v0

    .line 1088
    :pswitch_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateExternalMemberIdValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateExternalMemberIdValue:Ljava/lang/String;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_4

    :cond_b
    return v1

    :cond_c
    :goto_4
    return v0

    .line 1086
    :pswitch_5
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userMigrationFailedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->userMigrationFailedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_e

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_5

    :cond_d
    return v1

    :cond_e
    :goto_5
    return v0

    .line 1084
    :pswitch_6
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyPairedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyPairedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_10

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    goto :goto_6

    :cond_f
    return v1

    :cond_10
    :goto_6
    return v0

    .line 1082
    :pswitch_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userOnAnotherTeamValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->userOnAnotherTeamValue:Ljava/lang/String;

    if-eq v2, p1, :cond_12

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    goto :goto_7

    :cond_11
    return v1

    :cond_12
    :goto_7
    return v0

    .line 1080
    :pswitch_8
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyOnTeamValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyOnTeamValue:Ljava/lang/String;

    if-eq v2, p1, :cond_14

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    goto :goto_8

    :cond_13
    return v1

    :cond_14
    :goto_8
    return v0

    .line 1078
    :pswitch_9
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    if-eq v2, p1, :cond_16

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_15

    goto :goto_9

    :cond_15
    return v1

    :cond_16
    :goto_9
    return v0

    .line 1076
    :pswitch_a
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->teamLicenseLimitValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MemberAddResult;->teamLicenseLimitValue:Ljava/lang/String;

    if-eq v2, p1, :cond_18

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_17

    goto :goto_a

    :cond_17
    return v1

    :cond_18
    :goto_a
    return v0

    :cond_19
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getDuplicateExternalMemberIdValue()Ljava/lang/String;
    .locals 3

    .line 806
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->DUPLICATE_EXTERNAL_MEMBER_ID:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 809
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateExternalMemberIdValue:Ljava/lang/String;

    return-object v0

    .line 807
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.DUPLICATE_EXTERNAL_MEMBER_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDuplicateMemberPersistentIdValue()Ljava/lang/String;
    .locals 3

    .line 867
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->DUPLICATE_MEMBER_PERSISTENT_ID:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 870
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    return-object v0

    .line 868
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.DUPLICATE_MEMBER_PERSISTENT_ID, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFreeTeamMemberLimitReachedValue()Ljava/lang/String;
    .locals 3

    .line 503
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->FREE_TEAM_MEMBER_LIMIT_REACHED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 506
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    return-object v0

    .line 504
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.FREE_TEAM_MEMBER_LIMIT_REACHED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPersistentIdDisabledValue()Ljava/lang/String;
    .locals 3

    .line 928
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->PERSISTENT_ID_DISABLED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 931
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->persistentIdDisabledValue:Ljava/lang/String;

    return-object v0

    .line 929
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.PERSISTENT_ID_DISABLED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/team/TeamMemberInfo;
    .locals 3

    .line 1035
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 1038
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfo;

    return-object v0

    .line 1036
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTeamLicenseLimitValue()Ljava/lang/String;
    .locals 3

    .line 443
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->TEAM_LICENSE_LIMIT:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 446
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->teamLicenseLimitValue:Ljava/lang/String;

    return-object v0

    .line 444
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.TEAM_LICENSE_LIMIT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserAlreadyOnTeamValue()Ljava/lang/String;
    .locals 3

    .line 566
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_ALREADY_ON_TEAM:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 569
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyOnTeamValue:Ljava/lang/String;

    return-object v0

    .line 567
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_ALREADY_ON_TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserAlreadyPairedValue()Ljava/lang/String;
    .locals 3

    .line 686
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_ALREADY_PAIRED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 689
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyPairedValue:Ljava/lang/String;

    return-object v0

    .line 687
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_ALREADY_PAIRED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserCreationFailedValue()Ljava/lang/String;
    .locals 3

    .line 987
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_CREATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 990
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userCreationFailedValue:Ljava/lang/String;

    return-object v0

    .line 988
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_CREATION_FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserMigrationFailedValue()Ljava/lang/String;
    .locals 3

    .line 745
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_MIGRATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 748
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userMigrationFailedValue:Ljava/lang/String;

    return-object v0

    .line 746
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_MIGRATION_FAILED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUserOnAnotherTeamValue()Ljava/lang/String;
    .locals 3

    .line 628
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_ON_ANOTHER_TEAM:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    .line 631
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userOnAnotherTeamValue:Ljava/lang/String;

    return-object v0

    .line 629
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.USER_ON_ANOTHER_TEAM, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 14

    .line 1043
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->teamLicenseLimitValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->freeTeamMemberLimitReachedValue:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyOnTeamValue:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userOnAnotherTeamValue:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userAlreadyPairedValue:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userMigrationFailedValue:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateExternalMemberIdValue:Ljava/lang/String;

    iget-object v8, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->duplicateMemberPersistentIdValue:Ljava/lang/String;

    iget-object v9, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->persistentIdDisabledValue:Ljava/lang/String;

    iget-object v10, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->userCreationFailedValue:Ljava/lang/String;

    iget-object v11, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->successValue:Lcom/dropbox/core/v2/team/TeamMemberInfo;

    const/16 v12, 0xc

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v0, v12, v13

    const/4 v0, 0x1

    aput-object v1, v12, v0

    const/4 v0, 0x2

    aput-object v2, v12, v0

    const/4 v0, 0x3

    aput-object v3, v12, v0

    const/4 v0, 0x4

    aput-object v4, v12, v0

    const/4 v0, 0x5

    aput-object v5, v12, v0

    const/4 v0, 0x6

    aput-object v6, v12, v0

    const/4 v0, 0x7

    aput-object v7, v12, v0

    const/16 v0, 0x8

    aput-object v8, v12, v0

    const/16 v0, 0x9

    aput-object v9, v12, v0

    const/16 v0, 0xa

    aput-object v10, v12, v0

    const/16 v0, 0xb

    aput-object v11, v12, v0

    invoke-static {v12}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 1057
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isDuplicateExternalMemberId()Z
    .locals 2

    .line 759
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->DUPLICATE_EXTERNAL_MEMBER_ID:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isDuplicateMemberPersistentId()Z
    .locals 2

    .line 820
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->DUPLICATE_MEMBER_PERSISTENT_ID:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFreeTeamMemberLimitReached()Z
    .locals 2

    .line 457
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->FREE_TEAM_MEMBER_LIMIT_REACHED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isPersistentIdDisabled()Z
    .locals 2

    .line 881
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->PERSISTENT_ID_DISABLED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 1001
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isTeamLicenseLimit()Z
    .locals 2

    .line 398
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->TEAM_LICENSE_LIMIT:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserAlreadyOnTeam()Z
    .locals 2

    .line 517
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_ALREADY_ON_TEAM:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserAlreadyPaired()Z
    .locals 2

    .line 642
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_ALREADY_PAIRED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserCreationFailed()Z
    .locals 2

    .line 942
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_CREATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserMigrationFailed()Z
    .locals 2

    .line 700
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_MIGRATION_FAILED:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUserOnAnotherTeam()Z
    .locals 2

    .line 580
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MemberAddResult$Tag;->USER_ON_ANOTHER_TEAM:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/MemberAddResult$Tag;
    .locals 1

    .line 387
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MemberAddResult;->_tag:Lcom/dropbox/core/v2/team/MemberAddResult$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1108
    sget-object v0, Lcom/dropbox/core/v2/team/MemberAddResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MemberAddResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MemberAddResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 1120
    sget-object v0, Lcom/dropbox/core/v2/team/MemberAddResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MemberAddResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MemberAddResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
