//
//  ScriptEnum.swift
//
//  Created by gerp83 on 06/06/2024
//

enum ScriptEnum: String {

    case head = """
        #!/usr/bin/env bash
        set -euo pipefail
        """

    case log = """
        log() { printf -- "%s\\n" "$*" >&2; }
        """

    case directories = """
        CURRENT_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        chmod -R oug+x "${CURRENT_SCRIPT_DIR}"
        REPO_ROOT="$(git -C "$PWD" rev-parse --show-toplevel)"
        """

    case defaultUnaccepableLanguageValues = """
        blacklist
        whitelist
        slave
        master
        sane
        sanity
        insane
        insanity
        kill
        killed
        killing
        hang
        hung
        hanged
        hanging
        """

    case defaultSwiftFormatConfig = """
        {
            "fileScopedDeclarationPrivacy" : {
                "accessLevel" : "private"
            },
            "indentation" : {
                "spaces" : 4
            },
            "indentConditionalCompilationBlocks" : false,
            "indentSwitchCaseLabels" : false,
            "lineBreakAroundMultilineExpressionChainComponents" : true,
            "lineBreakBeforeControlFlowKeywords" : true,
            "lineBreakBeforeEachArgument" : true,
            "lineBreakBeforeEachGenericRequirement" : true,
            "lineLength" : 80,
            "maximumBlankLines" : 1,
            "prioritizeKeepingFunctionOutputTogether" : true,
            "respectsExistingLineBreaks" : true,
            "rules" : {
                "AllPublicDeclarationsHaveDocumentation" : true,
                "AlwaysUseLowerCamelCase" : false,
                "AmbiguousTrailingClosureOverload" : true,
                "BeginDocumentationCommentWithOneLineSummary" : false,
                "DoNotUseSemicolons" : true,
                "DontRepeatTypeInStaticProperties" : false,
                "FileScopedDeclarationPrivacy" : true,
                "FullyIndirectEnum" : true,
                "GroupNumericLiterals" : true,
                "IdentifiersMustBeASCII" : true,
                "NeverForceUnwrap" : false,
                "NeverUseForceTry" : false,
                "NeverUseImplicitlyUnwrappedOptionals" : false,
                "NoAccessLevelOnExtensionDeclaration" : false,
                "NoAssignmentInExpressions" : true,
                "NoBlockComments" : true,
                "NoCasesWithOnlyFallthrough" : true,
                "NoEmptyTrailingClosureParentheses" : true,
                "NoLabelsInCasePatterns" : false,
                "NoLeadingUnderscores" : false,
                "NoParensAroundConditions" : true,
                "NoVoidReturnOnFunctionSignature" : true,
                "OneCasePerLine" : true,
                "OneVariableDeclarationPerLine" : true,
                "OnlyOneTrailingClosureArgument" : true,
                "OrderedImports" : false,
                "ReturnVoidInsteadOfEmptyTuple" : true,
                "UseEarlyExits" : false,
                "UseLetInEveryBoundCaseVariable" : false,
                "UseShorthandTypeNames" : true,
                "UseSingleLinePropertyGetter" : false,
                "UseSynthesizedInitializer" : true,
                "UseTripleSlashForDocumentationComments" : true,
                "UseWhereClausesInForLoops" : false,
                "ValidateDocumentationComments" : true
            },
            "spacesAroundRangeFormationOperators" : false,
            "tabWidth" : 4,
            "version" : 1
        }
        """

}
